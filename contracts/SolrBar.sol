pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";


contract SolrBar is ERC20("SolrBar", "xSOLR"){
    using SafeMath for uint256;
    IERC20 public solr;

    constructor(IERC20 _solr) public {
        solr = _solr;
    }

    // Enter the bar. Pay some SOLRs. Earn some shares.
    function enter(uint256 _amount) public {
        uint256 totalSolr = solr.balanceOf(address(this));
        uint256 totalShares = totalSupply();
        if (totalShares == 0 || totalSolr == 0) {
            _mint(msg.sender, _amount);
        } else {
            uint256 what = _amount.mul(totalShares).div(totalSolr);
            _mint(msg.sender, what);
        }
        solr.transferFrom(msg.sender, address(this), _amount);
    }

    // Leave the bar. Claim back your SOLRs.
    function leave(uint256 _share) public {
        uint256 totalShares = totalSupply();
        uint256 what = _share.mul(solr.balanceOf(address(this))).div(totalShares);
        _burn(msg.sender, _share);
        solr.transfer(msg.sender, what);
    }
}