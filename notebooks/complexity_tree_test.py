import sys
import matplotlib.pyplot as plt
import pandas as pd
from IPython.display import display
from IPython.display import HTML

import thicket as th
import hatchet as ht
from thicket.model_extrap import Modeling

display(HTML("<style>.container { width:80% !important; }</style>"))

# display all columns from pandas data frames
pd.options.display.max_columns = None

data = "../../data/LULESH/exclusive/weak"
th_lulesh = th.Thicket.from_caliperreader(data)

mdl = Modeling(
    th_lulesh,
    parameters=[
        "jobsize",
        # "problem_size",
    ],
    metrics=[
        # "Avg time/rank",
        "Avg time/rank (exc)",
        # "Total time",
    ],
)

mdl.produce_models(use_median=True)

mdl.complexity_statsframe(eval_target=[512])


th.median(th_lulesh, columns=['Avg time/rank (exc)'])
colors = ["\033[0;38;5;2m"]
c = []
for i in range(55):
    c.append("\033[38;2;255;0;255m")

# "Avg time/rank (exc)_extrap-model_colormapping"

x = th_lulesh.statsframe.dataframe["Avg time/rank (exc)_extrap-model_colormapping"]

print("x:", x)

print(str(th_lulesh.statsframe.tree(
    metric_column='Avg time/rank (exc)_median',
    annotation_column="Avg time/rank (exc)_extrap-model_complexity",
    colormap="RdYlGn",
    colormap_annotations=c)))
