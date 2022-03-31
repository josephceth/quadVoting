from webbrowser import get
from brownie import exceptions
from scripts.deploy import deployContract
from scripts.helpers import getAccount


def test_addVotingCreditsToAddress():
    contract = deployContract()
    txn = contract.addVotingCreditsToAddress(getAccount(), 100)
    txn.wait(1)
    assert contract.getAddressCreditBalance(getAccount()) == 100
    txn = contract.addVotingCreditsToAddress(getAccount(), 100)
    txn.wait(1)
    assert contract.getAddressCreditBalance(getAccount()) == 200
    assert contract._voters(0) == getAccount()
    assert contract.isVoter(getAccount()) == True
    assert contract.isVoter(getAccount(1)) == False
