import subprocess, glob, json
from pathlib import Path
from dataclasses import dataclass
import tqdm
import pandas as pd

_script_dir = Path( __file__ ).parent
_root_dir = _script_dir.parent
_runs_dir = _root_dir / "runs"
_results_dir = _root_dir / "results"
_jar_rel = Path("target")  / "scala-2.13" / "deepbug-assembly-0.1.jar"
_jar = _root_dir / _jar_rel
_plot_dir = _root_dir / "plots"


def check_jar():
    assert _jar.exists(), f"Failed to find JAR, did you run sbt assembly?\n{_jar}"


def run_reveal(design: str):
    args = ["--design", design, "--method", "reveal"]
    run(args)

def run_bmc(design: str, harness: str, timeout = -1):
    assert harness in {'universal', 'formal'}, harness
    print("-------------------------")
    print(f"Running BMC for {design} with {harness} harness")
    print("-------------------------")
    args = ["--design", design, "--harness", harness, "--method", "bmc", "--timeout", str(timeout)]
    run(args)

def run_random(design: str, harness: str, seeds: int, cycles: int, restarts: int):
    assert harness in {'universal', 'software'}, harness
    print("-------------------------")
    print(f"Running Random for {design} with {harness} harness")
    print("-------------------------")
    args = ["--design", design, "--harness", harness, "--method", "random", "--gen-seed", f"0:{seeds}", "--cycles", str(cycles), "--restarts", str(restarts)]
    run(args)


def run(args: list):
    check_jar()
    cmd = ["java", "-cp", _jar_rel, "deepbug.Main"] + args
    subprocess.run(cmd, cwd=_root_dir, check=True)

@dataclass
class Result:
    design: str
    width: int
    depth: int
    method: str
    harness: str
    avg_input_len: float
    success: float
    avg_time: float
    filename: str

def _load_result(filename: Path) -> Result:
    with open(filename) as f:
        data = json.load(f)
        design = data['conf']['design']
        if design != "deepbug":
            width = int(data['conf']['designParams']['width'])
        else:
            width = 0
        if design == "arbitrated":
            num_fifos = int(data['conf']['designParams']['numFifos'])
            design += f"_{num_fifos}"
        harness = data['conf']['harness']
        depth = int(data['conf']['designParams']['depth'])
        r = data['res']
        avg_time_ms = r['averageTime'] / 1000.0 / 1000.0
        return Result(design, width, depth, data['conf']['method'], harness,
           avg_input_len = r['averageInputLength'],
           success = r['successRate'],
           avg_time = avg_time_ms / 1000.0,
           filename=str(filename)
        )

def load_results(directory = _results_dir) -> pd.DataFrame:
    files = glob.glob("*/*.json", root_dir=directory)
    res = []
    for f in tqdm.tqdm(files):
        res.append(_load_result(directory / f))
    df = pd.DataFrame(res)
    df = df.sort_values(by=['depth'])
    return df

def get_plot_dir():
    if not _plot_dir.exists():
        _plot_dir.mkdir()
    return _plot_dir