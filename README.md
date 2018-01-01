The purpose of this project is to compare the performance of a nested
set model with an adjacency list model of hierarchies for modeling containers.

Results:

|Query|Nested Set|Adjacency List|
|-----|----------|--------------|
|all descendants|.225 seconds|.977 seconds|
|one fourth descendants|.120 seconds|.505 seconds|
|one sixteenth descendants| .090 seconds| .374 seconds|
