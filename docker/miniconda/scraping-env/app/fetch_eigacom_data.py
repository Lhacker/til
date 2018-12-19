# https://colab.research.google.com/drive/1R8r4NTJnyFtTI3mwH_XOO2zU05OmcY_5#scrollTo=VpBPR1WYelwu

#文字化け防止　https://orangain.hatenablog.com/entry/encoding-in-requests-and-beautiful-soup
#!pip install chardet

from bs4 import BeautifulSoup
import csv
import math
import random
import re
import requests
from time import sleep

EIGA_COM_URL = "https://eiga.com"
MOVIE_COUNT_ON_ONE_PAGE = 100
MAX_PAGE_COUNT_FOR_SEARCH = 10
MAX_INDEX_FOR_SEARCH = 20
THRESHOLD_YEAR = 1980
TSV_FILE_NAME = "movie-data.tsv"

def append_tsv(movie_name, movie_url, movie_image_url):
    with open(TSV_FILE_NAME, 'a', newline="") as f:
        writer = csv.writer(f, delimiter="\t", quotechar='"', quoting=csv.QUOTE_MINIMAL)
        writer.writerow([movie_name, movie_url, movie_image_url])

def main():
    html_doc = requests.get(EIGA_COM_URL + "/movie/all/")
    soup = BeautifulSoup(html_doc.content, 'html.parser') 
    
    movie_japanese_one_kana_links = soup.select(".syllabaryBox a")
    
    for movie_japanese_one_kana_link in movie_japanese_one_kana_links:
        html_doc = requests.get(EIGA_COM_URL + movie_japanese_one_kana_link.attrs["href"])
        soup = BeautifulSoup(html_doc.content, 'html.parser')
        
        # ページングでランダムなページからスクレイピングするため、ランダムなページを作成(件数も絞る)
        hit_count = int(soup.select(".page_info b")[0].get_text("", strip=True))
        max_page_count = math.ceil(hit_count / MOVIE_COUNT_ON_ONE_PAGE)
        random_page_no_list  = list(range(1, max_page_count))
        random.shuffle(random_page_no_list)
        random_page_no_list = random_page_no_list[0:MAX_PAGE_COUNT_FOR_SEARCH]
    
        for page_no in random_page_no_list:
            str_page_no_part = "" if page_no == 1 else str(page_no) + "/"
            html_doc = requests.get(EIGA_COM_URL + movie_japanese_one_kana_link.attrs["href"] + str_page_no_part)
            soup = BeautifulSoup(html_doc.content, 'html.parser')
            
            # 100件の映画もランダムで取得
            random_index_list  = list(range(0, MOVIE_COUNT_ON_ONE_PAGE - 1))
            random.shuffle(random_index_list)
            random_index_list = random_index_list[0:MAX_INDEX_FOR_SEARCH]
            movie_detail_links = soup.select("#movie_list a")
            
            for idx in random_index_list:
                movie_detail_link = movie_detail_links[idx]
                movie_url = EIGA_COM_URL + movie_detail_link.attrs["href"]
                html_doc = requests.get(movie_url)
                soup = BeautifulSoup(html_doc.content, 'html.parser') 
                
                y = soup.find(text="製作年")
                if y is None:
                    continue
                created_year = int(y.findNext("td").get_text("", strip=True)[:-1])
                if created_year < THRESHOLD_YEAR:
                    continue
                
                movie_name = soup.select(".moveInfoBox h1")[0].get_text("", strip=True)
                movie_image_url = soup.select(".pictBox img")[0].attrs["src"].split("?")[0];
                if (movie_image_url.count("/noposter/")):
                    movie_image_url = ""

                append_tsv(movie_name, movie_url, movie_image_url)

                sleep(0.5)

if __name__ == "__main__":
    main()
