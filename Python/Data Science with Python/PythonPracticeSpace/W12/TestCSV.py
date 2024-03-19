import csv

with open('MI_5MINS_HIST.csv', encoding='Big5') as f:
    with open('MI_5MINS_HIST_UTF8.csv', 'w', encoding='UTF8', newline='') as f2:
        rows = csv.reader(f)
        csv.writer(f2).writerows(rows)
