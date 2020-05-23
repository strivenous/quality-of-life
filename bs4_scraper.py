#!/usr/bin/env python3
from bs4 import BeautifulSoup
from strivencore import *
import requests
from discord_webhook import DiscordWebhook, DiscordEmbed

webhook = DiscordWebhook(url='insert webhook link here')
playersformat = DiscordWebhook(url=webhook, content='Webhook Message') # @TODO add players list content

page = requests.get(url)
soup = BeautifulSoup(page.content, lxml)


"""
vars taken from strivencore

"""