// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/access/Ownable.sol";

struct Post {
    string text;
    uint64 timestamp;
}

contract TwitterAccount is Ownable {
    Post[] public posts;

    function tweet(string memory _text) public onlyOwner {
        Post memory newPost;
        newPost.text = _text;
        newPost.timestamp = uint64(block.timestamp);
        posts.push(newPost);
    }

    function posts_take(uint32 n) public view returns (Post[] memory) {
        require(n <= posts.length, "Requested more posts than available");
        Post[] memory result;
        for (uint i = 0; i < n; i++) {
            result[i] = posts[i];
        }
        return result;
    }
}
