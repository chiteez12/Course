import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import json

# In this project, we will analyse and visualise companies' sales, profits and stock prices. It's very exciting. wakuwaku! ❤️😍🤩

# Functions:
# function to print company names


def print_cmpn() -> list[str]:
    cmpn = ['Suzlon', 'Zomato', 'Reliance']
    print("Select an option:")
    for i in range(len(cmpn)):
        print(f"{i + 1}. {cmpn[i]}")
    return cmpn


# function to show options
def show_op() -> int:
    print("Select an option:")
    print("1. Growth of sales")
    print("2. Growth of profits")
    print("3. Comparison of yearly sales")
    print("4. Comparison of yearly profits")
    print("5. Sales distribution")
    print("6. Profit distribution")
    print("7. Stock Price distribution in a month")
    print("8. Exit")
    try:
        a = int(input('Enter an option:'))
    except Exception:
        print("Invalid input!")
        return -1
    return a


# function to plot data
def plot_graph(grp: str, data: pd.DataFrame, x: str, y: str = '') -> None:
    try:
        plt.figure(figsize=(10, 5))
        if grp == 'line':
            sns.lineplot(x=x, y=y, data=data)
            plt.xticks(df['Year'])
        elif grp == 'bar':
            sns.barplot(x=x, y=y, data=data)
        elif grp == 'pie':
            plt.pie(data[x], autopct="%1.1f%%",
                    labels=list(data['Year']))
        elif grp == 'hist':
            sns.histplot(x=x, data=data)
    except Exception:
        print("An error occured. Please try again!")
    return


# function to organise and control plot output.
def output(cmp: str, op: int) -> None:
    global df, df2

    # only select words after _ in df.
    cols = [x.split('_')[-1] for x in list(df.columns)]

    if (op == 1) or (op == 2):  # line plots only
        plot_graph('line', df, 'Year', cmp+'_'+cols[op])
        plt.title(f"{cmp} {cols[op]} growth")

    elif (op == 3) or (op == 4):  # bar plots only
        plot_graph('bar', df, 'Year', cmp+'_'+cols[op])
        plt.title(f"{cmp} yearly {cols[op]} comparsion")

    elif (op == 5) or (op == 6):  # pie charts only
        plot_graph('pie', df, cmp+'_'+cols[op])
        plt.title(f"{cmp} yearly {cols[op]} distribution")

    else:
        # histogram
        plot_graph('hist', df2, cmp)
        plt.title(f'{cmp} stock price distribution')

    plt.grid()
    plt.show()
    return


# function to plot comparison data
def comparison(grp_ty: str, data: pd.DataFrame, x: str, cols: tuple[str, str] | tuple[str, str, str], metric: str) -> None:
    data = data.melt(id_vars='Year', value_vars=cols)
    plt.title(f'Company {metric} comparison')
    if grp_ty == 'line':
        sns.lineplot(x=x, y='value', hue='variable', data=data)
        plt.xticks(data[x])
    else:
        sns.barplot(x=x, y='value', hue='variable', data=data)
    plt.xlabel('Years')
    plt.ylabel(metric)
    plt.legend()
    plt.grid()
    plt.tight_layout()
    plt.show()


# Main:
# read and load the data:
with open('data.json', 'r') as f:
    data = json.load(f)
df = pd.DataFrame(data['data'])
df2 = pd.DataFrame(data['dataH'])

while True:
    # display the company names and comparison options:
    print_cmpn()
    print('4. Compare two companies\n5. Compare all companies\n6. Exit')
    try:
        ch = int(input("Enter option no. :"))
    except Exception:
        print('Please enter a number!')
        continue

    # Exit if 6 is typed:
    if ch == 6:
        break

    # Single company block:
    elif ch == 1 or ch == 2 or ch == 3:
        while True:
            # Print the options for single companies only:
            op = show_op()  # returns -1 if any error
            if op == 8 or op == -1:
                break

            match ch:
                case 1:
                    output('Suzlon', op)
                case 2:
                    output('Zomato', op)
                case 3:
                    output("Reliance", op)

    # Comparison block:
    elif ch == 4 or ch == 5:
        # Print the below for comparison only:
        # sales or profit
        print("Select a metric:")
        print("1. Sales growth")
        print("2. Profits growth")
        s_p = int(input("Enter option no.:"))
        s_p = 'sales' if s_p == 1 else 'profits'

        # select graph type
        print("Enter graph type:")
        print('1. Line graph')
        print('2. Bar graph')
        grp_ty = int(input("Enter option no.:"))
        grp_ty = 'line' if grp_ty == 1 else 'bar'

        if ch == 5:
            # Compare all the companies:
            comparison(grp_ty, df, 'Year',
                       ('Suzlon_'+s_p, 'Zomato_'+s_p, 'Reliance_'+s_p), s_p.capitalize())
        else:
            # ask for two company names:
            cname = print_cmpn()
            try:
                a = int(input("Enter first company no. :"))
                b = int(input('Enter second company no. :'))
                a = cname[a-1]  # indexing the company name
                b = cname[b-1]  # indexing the company name
            except Exception:
                print("Invalid input!")
                continue
            comparison(grp_ty, df, 'Year',
                       (a+'_'+s_p, b+'_'+s_p), s_p.capitalize())

    else:
        print("Invalid input! Please try again.")
        continue
