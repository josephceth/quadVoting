from scripts.helpers import getAccount
from brownie import QuadVoting, network, config


def deployContract():
    account = getAccount()
    contract = QuadVoting.deploy(
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("verify", False),
    )
    print("Contract Deployed Successfully")
    return contract.isVoter(getAccount()) == False


def main():
    deployContract()
