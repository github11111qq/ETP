contract ETP is EthcEvents{

struct  Player {

    uint256 pID;      
    address payable addr;      
    uint256 affId;      
    uint256 totalBet;  
    uint256 curGen;   
    uint256 curAff;    
    string  inviteCode;
   
}

 function()
        isActivated()
        isHuman()
        external
        payable{}


 function ethcomein(string memory _inviteCode,string memory _referrer)
        isActivated()
        isHuman()
       
        public
        payable
    {
        
        determinePID(_inviteCode);
        buyCore(_pID,msg.value);
    }





function buyCore(uint256 _pID,uint256 _eth)
    isWithinLimits(msg.value)
    private
{
    
    
   uint256 _com = _eth.mul(2)/100;
    if(_com>0){
        bose.transfer(_com);
    }
    
    if(now - bxStartTime_ >= bxTime_){
        
        bxStartTime_ = now;
        bxTotalCoin = 0;
    }
    
    
    uint256 _baoxian = _eth.mul(3)/100;
    if(_baoxian>0){
        
        bx.transfer(_baoxian);
        bxTotalCoin = bxTotalCoin.add(_baoxian);
        bxStartTime_ = now;
    }
    
   
    uint256 _st = _eth.mul(3)/100;
    if(_st>0){
        
        st.transfer(_st);
       
    }
  
    gBet_ = gBet_.add(_eth);
    gBetcc_= gBetcc_ + 1; 
 
}


function checkInviteCode(string memory _code)  public view returns(uint256 _pID){
    
    _pID = pIDInviteCode_[_code];
    
}


function getLevel (uint256 _betEth) 
public
view
returns(uint8 level) 
{
    uint8 _level = 0;
    if(_betEth>=61 * ethWei){
        _level = 5;

    }else if(_betEth>=31 * ethWei){
        _level = 4;

    }else if(_betEth>=11 * ethWei){
        _level = 3;

    }else if(_betEth>=6 * ethWei){
        _level = 2;

    }else if(_betEth>=1 * ethWei){
        _level = 1;

    }
    return _level;
}


function getPlayerlaByAddr (address _addr)
public
view
returns(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256)
{
    uint256 _pID = pIDxAddr_[_addr];
    
    (uint256 _gen,uint256 _aff,) = getUserRewardByBase(_pID);
    
    uint256 totalGenH =  plyrReward_[_pID].totalGen - plyrReward_[_pID].withDrawEdGen + _gen;
    uint256 totalAffH =  plyrReward_[_pID].totalAff - plyrReward_[_pID].withDrawEdAff + _aff;
    
    return(
        _pID,
        plyrReward_[_pID].reward.sub(plyr_[_pID].curGen + plyr_[_pID].curAff+_gen+_aff)>0?plyrReward_[_pID].reward.sub(plyr_[_pID].curGen + plyr_[_pID].curAff+_gen+_aff):0,
        plyrReward_[_pID].totalGen + _gen,
        plyrReward_[_pID].totalAff + _aff,
        totalGenH,
        totalAffH,
        withDrawSet_[_pID].shengyu,
        plyr_[_pID].baseGen,
        plyr_[_pID].baseAff,
        affBijiao_[zhuoyueRound_][_pID]
        
        );


}

function getPlayerlaById (uint256 _pID)
public
view
returns(uint256 affid,address addr,uint256 totalBet,uint256 level,uint256 _zypot,uint256 _bdpot,uint256 _luckpot,string memory inviteCode,string memory affInviteCode)
{
   require(_pID>0 && _pID < nextId_, "Now cannot withDraw!");
   
    affid =  plyr_[_pID].affId;
    addr  = plyr_[_pID].addr;
    totalBet = plyr_[_pID].totalBet;
    level = plyrReward_[_pID].level;
    _zypot = playerPot_[_pID].zhuoyuepot;
    _bdpot = playerPot_[_pID].bdpot;
    _luckpot = playerPot_[_pID].luckpot;
    //withDrawEdGen = plyrReward_[_pID].withDrawEdGen;
    //withDrawEdAff = plyrReward_[_pID].withDrawEdAff;
    inviteCode = plyr_[_pID].inviteCode;
    affInviteCode =plyr_[plyr_[_pID].affId].inviteCode;
      


}


function somethingmsg () 
public
view
returns(uint256 _withdrawPt,uint8 _withdrawCcMax,uint256 _withdrawRate,uint256 _withrawBetmin,uint256 _minbeteth,uint256 _genReleTime)
{
    return(
        withdrawPt,
        withdrawCcMax,
        withdrawRate,
        withrawBetmin,
        minbeteth_,
        genReleTime_
        );

}


function getsystemMsg()
public
view
returns(uint256 _gbet,uint256 _gcc,uint256 _luckpot,uint256 _zypot,uint256 _zytime,uint256 _bxTotalCoin,uint256 _luckround,uint256 _zyround,uint256 _bdround,uint256 _bdPot,uint256 _bdtime,uint256 _bxTime)
{
    return
    (
        gBet_,
        gBetcc_,
        luckyPot_,
        zhuoyuePot_,
        zuoyuePotDaoshuTime_+zuoyuePotDaoshuStartTime_,
        bxTotalCoin,
        luckyRound_,
        zhuoyueRound_,
        bdRound_,
        bdPot_,
        bdPotDaoshuStartTime_ + bdePotDaoshuTime_,
        bxStartTime_ + bxTime_
        
        
    );
}
}
