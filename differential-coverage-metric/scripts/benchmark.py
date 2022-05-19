import json
from pathlib import Path
from dataclasses import dataclass, field

@dataclass
class Signal:
    name: str
    expr: str

@dataclass
class Benchmark:
    name: str
    testbench: list # list[Path]
    verilog: list # list[Path]
    signals: list # list[Signal]
    convert_formal: Path
    seeds: list # list[Path]


def _load_signals(filename: Path) -> list: # list[Signal]:
    with open(filename) as ff:
        data = json.load(ff)
    return [Signal(name = e["name"], expr=e["expr"]) for e in data]

def _find_seeds(filename: Path) -> list: # list[Path]:
    return [ff for ff in filename.iterdir() if ff.is_file()]

def load_benchmark(benchmark: str) -> Benchmark:
    filename = Path(benchmark)
    assert filename.is_file(), f"Could not find benchmark file: {filename}"
    benchmark_dir = (filename / "..").resolve()
    def pp(fff: str) -> Path:
        p = Path(fff)
        if not p.is_absolute():
            p = benchmark_dir / p
        p = p.resolve()
        assert p.is_file() or p.is_dir(), f"File mentioned in {filename} does not exist: {p}"
        return p
    with open(filename) as ff:
        data = json.load(ff)
    b = Benchmark(
        name = data["name"],
        testbench = [pp(f) for f in data["testbench"]],
        convert_formal = pp(data["convert-formal"]),
        verilog = [pp(f) for f in data["verilog"]],
        signals = _load_signals(pp(data["signals"])),
        seeds = _find_seeds(pp(data["seeds"])) if "seeds" in data else [],
    )
    return b

def make_empty_signal_tracker(benchmark: Benchmark, directory: Path):
  out = "module SignalTracker(\n"
  sigs = ["clock", "reset"] + [s.name for s in benchmark.signals]
  inputs = ["  input " + s for s in sigs]
  out += ",\n".join(inputs)
  out += "\n);\nendmodule\n"
  with open(directory / "SignalTracker.sv", "w") as ff:
    ff.write(out)