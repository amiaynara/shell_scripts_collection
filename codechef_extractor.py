# This extracts the code for competive coding 
import requests
import pandas as pd

months=["january","february","march","april","may", "june", "july", "august","september", "october","november", "december"]
month_code=["JAN","FEB","MARCH","APRIL","MAY","JUNE","JULY","AUG","SEPT","OCT","NOV","DEC"]


class contest():

    def __init__(self, month, year):
        print("contest class created")
        self.month=month
        self.year=year%2000
        self.contest_url="https://www.codechef.com/"
        self.code_dictionary = {months[i] : month_code[i] for i in range(12)}
        self.no_of_questions=10
        self.questions_dataframe=1
        self.create_contest_url()
        self.extract_data()


    def create_contest_url(self):
        print("creating url")
        self.contest_url+=self.code_dictionary[self.month.lower()]+str(self.year)+"B"
        return self.contest_url

    def extract_data(self):
        print("extracting data")
        request=requests.get(self.contest_url)
        extracted_content = request.content
        extracted_table = pd.read_html(extracted_content)
        self.questions_dataframe = extracted_table[-1]
        self.no_of_questions = len(self.questions_dataframe)

    def get_question_count(self):
        print("Returning number")
        return self.no_of_questions

    def get_question_code(self):
        return self.questions_dataframe["Code"].values

    def get_question_name(self):
        return self.questions_dataframe["Name"].values

    def get_submission_stats(self):
        return self.questions_dataframe["Successful Submission"].values

    def get_question_accuracy(self):
        return self.questions_dataframe["Accuracy"].values
if __name__ == "__main__":
    month = input()
    year = int(input())
    current_contest = contest(month, year)

    print(current_contest.get_question_name())
    print(current_contest.get_question_count())
