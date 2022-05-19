#!/usr/bin/env python3
import csv
import itertools

import tqdm
from matplotlib.ticker import ScalarFormatter

import utils
import matplotlib.pyplot as plt
import pandas as pd

designs = ["deepbug", "circular-fifo", "shift-fifo", "arbitrated_2", "arbitrated_3", "arbitrated_4"]
methods = [("random", "software"), ("random", "universal"), ("bmc", "formal"), ("bmc", "universal")]
values = ["avg_input_len", "avg_time"]
widths = [8, 64]

min_len = {
     # 1 -> 5 = 2 + 3, 2 -> 4 + 3, 3 -> 11 = 8 + 3
    'deepbug': lambda d: (1 << d) + 3,
    # 4 -> 8, 8 -> 12, 16 -> 20
    'circular-fifo': lambda d: d + 4,
    # 4 -> 9, 8 -> 17, 16 -> 33
    'shift-fifo': lambda d: (d * 2) + 1,
    # 4 -> 7, 8 -> 11, 16 -> 19 (independent of the number of fifos)
    'arbitrated_2': lambda d: d + 3,
    'arbitrated_3': lambda d: d + 3,
    'arbitrated_4': lambda d: d + 3,
}

skip_bmc_len = True

timeout_s = 15*60 # we enforce a 15min timeout (for random after the fact!)


# x-axis is always depth, y-axis can be selected
def plot(data, design: str, value: str):
    data = data[(data["design"] == design) & (data["success"] > 0) & (data["avg_time"] < timeout_s)]
    data = data.sort_values(by=['depth'])
    # print(data)
    filename = f"{design}_{value}.png"
    # print(filename)
    plt.figure()
    ax = plt.gca()
    xvalues = list(sorted(set(data["depth"])))

    values = [["x"] + xvalues]

    ws = [0] if design == "deepbug" else widths
    for (m, h) in methods:
        if skip_bmc_len and m == "bmc" and value == "avg_input_len":
            continue
        d0 = data[(data["method"] == m) & (data["harness"] == h)]
        for w in ws:
            d = d0[d0["width"] == w]
            lbl = f"{m}+{h}"
            if len(ws) > 1: lbl += f"+w={w}"
            values.append([lbl] + list(d[value]))
            d.plot(kind='line',x='depth',y=value,ax=ax, label=lbl)

    if value == "avg_input_len":
        min_lengths = [min_len[design](x) for x in xvalues]
        lbl = "min-len"
        values.append([lbl] + min_lengths)
        plt.plot(xvalues, min_lengths, label=lbl)

    plt.legend(loc="upper right")
    plt.title(f"{design} {value} vs depth")
    plt.xlabel("Depth")
    plt.ylabel(value)
    plt.yscale('log')
    if design != "deepbug":
        plt.xscale('log')
    plt.xticks(xvalues)
    ax.xaxis.set_major_formatter(ScalarFormatter())
    plt.savefig(utils.get_plot_dir() / filename)
    csv_filename = filename.split('.')[0] + ".csv"
    write_csv(utils.get_plot_dir() / csv_filename, values)

def write_csv(filename, columns):
    # first we need to transpose cols to rows
    rows = []
    for row in itertools.zip_longest(*columns, fillvalue=''):
        rows.append([str(e).replace('=', '_') for e in row])
    print()
    print(filename)
    print(columns)
    with open(filename, 'w') as f:
        writer = csv.writer(f)
        for row in rows:
            print(row)
            writer.writerow(row)

if __name__ == "__main__":
    data = utils.load_results()
    # filter out unsuccessful runs
    data = data[data["success"] > 0]
    iter = itertools.product(designs, values)
    for (design, v) in tqdm.tqdm(list(iter)):
        plot(data, design, v)