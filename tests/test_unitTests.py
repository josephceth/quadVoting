from webbrowser import get
from brownie import exceptions
from scripts.deploy import deployContract
from scripts.helpers import getAccount
from web3 import Web3
import pytest


def test_addVotingCreditsToAddress():
    contract = deployContract()
    # contract.addVotingCreditsToAddress(getAccount(), 100)
    # assert contract.getAddressCreditBalance(getAccount()) == 100
    # assert contract._voters[0] == getAccount()
    assert contract.isVoter(getAccount()) == False
