pragma solidity ^0.5.0;

contract SocialNetwork {

	string public name;
	uint public postCount = 0;
	mapping(uint => Post) public posts;


	struct Post {

		uint id;
		string content;
		uint tipAmount;
		address author;
	}

	event PostCreated(
		uint id,
		string content,
		uint tipAmount,
		address author
	);

	constructor() public {
		name = "Dapp University Social Network";
	}

	function createPosts(string memory _content) public {
		//Require valid _content
		require(bytes(_content).length > 0);

		// Increment the post count
		postCount ++;
		posts[postCount] = Post(postCount, _content, 0, msg.sender);
		emit PostCreated(postCount, _content, 0, msg.sender);
	}
}