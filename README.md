# N-gram-search-algorithm
An N-gram search algorithm using stringdist (R) to quantify the similarity of two non-standardized address entries. 
# adre.csv contains 2 columns. 
Column 1 contains the addresses we are looking to match, Column 2 contains random addresses in SF.
The data was crowdsourced so the entries vary on how people abbreviate or write their addresses. 
After cleaning the Data for more consistent address inputs.
The code uses the address on the column 1 and looks for the address that matches it the most from column 2. 
Finally it generates column 3 and column 4, where in column 3 it is a quantitive value of the match and column 4 is the address from column 2 that matched the most.
