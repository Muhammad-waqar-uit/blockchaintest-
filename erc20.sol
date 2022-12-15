pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract QTKN is ERC20{
    constructor() ERC20("QTKN","Q"){}
    function issueToken(address reciver,uint256 amount) public{
        _mint(reciver,amount);
    }
}

contract School{
    uint256 termschool;
    uint256 termteacher;
    uint256  coursebasefee;
    function set_term(uint256 _terms,uint256 _termteacher)public{
        termschool=_terms;
        termteacher=_termteacher;
    }
}


contract teacher is School{
    string name;
    string course;
    string teachername;
    uint256 fee;
    uint256 terms;
     function create_course(string memory _course) public{
        course=_course;
    }

    function assign_course(string memory _teachername,string memory _course)public{
        teachername=_teachername;
        course=_course;
    }

    function assign_self(string memory _name,string memory _course) public{
        name=_name;
        course=_course;
    }

    function course_price(string memory _course,uint256 _fee,uint256 con)public{
        fee+(fee*0.3)+con.schoolbasefee=_fee;
    }

    function Term(string memory _teachername,uint256 _terms,uint256 _termteacher)public{
        if (School.termschool<termteacher){
            return "cannot set base term to school term";
        }else{termteacher=_termteacher;
        termschool=_terms;}
    }
}

contract student is School{
    QTKN con;
    string name;
    string coursename;
    uint256 no_of_Token;
    function buyToken(string memory _name,uint256 no_of_Token)public{
        con.issueToken(address,no_of_Token);
    }

    function register(string memory _coursename,string memory _name)public{
        coursename=_coursename;
        name=_name;
    }
}