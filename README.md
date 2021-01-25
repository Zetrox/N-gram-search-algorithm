# N-gram-search-algorithm
An N-gram search algorithm using stringdist (R) to quantify the similarity of two non-standardized address entries. 
adre.csv contains two columns. Column 2 contains random addresses in SF, and column 1 contains the addresses we are looking to match.
The data was crowdsourced so the entries vary on how people abbreviate or write their address. 
The code uses the address on the first column and looks for the address that matches it the most from column 2. 
