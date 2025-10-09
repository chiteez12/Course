# Company data visualisation
I have made this project to visualise companies' sales, profits and stock price data.
It can be used to analyse growth and compare different companies.

## Technologies used:
1. pandas
2. matplotlib
3. seaborn
4. json

## Overview
1. It asks user to select a company or comparison of companies. Exit option is present everywhere in the code.
2. It then shows a number of operations which can be performed on the company's data and asks the user to select one of them. For example, plotting sales/profits growth, stock price distribution etc.
3. Then the user can select the type of graph for visualisation.
4. Then, final output is displayed in a matplotlib figure.

## Comparison overview:
1. In case the comparison options is selected, it asks the user to select atleast two companies or all are selected automatically accoring to the option.
2. It then asks the user to either choose sales/profits.
3. It then tasks the user to choose the type of graph.
4. Final output is displayed using seaborn in matplotlib figure.

## Overview of functions
1. print_cmpn: Prints the companies' name in an order.
2. show_op: Prints the operations that can be performed on the data
3. plot_graph: Plots a graph with the given data using seaborn and matplotlib.
4. output: Controls and manipulates the plot_function according to the selected operation. 
5. comparison: It melts the given values and then plots a line/bar graph for comparison of selected companies.

## Challenges faced
1. Determining the type of graph for each operation. Solution: output function
2. Print list of operations for every company without repetition. Solution: show_op
3. Plot the comparison of companies using seaborn and df. Solution: comparison function.

## Conclusion
This project taught me real-world visualisation of data and its challenges. This project should be built by everyone for practicing pandas and data visualisation using real world data.