import React from 'react';
import DeletePost from '../DeletePost';
import PostForm from '../PostForm';

class BlogContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: [],
    };
  }
  componentDidMount() {
    this.getAllPosts();
  }

  getAllPosts = () => {
    fetch('/graphql', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify({
        query: `
          query {
            posts {
              id,
              title,
              content
            }
          }
        `,
      })
    }).then(response => {
      console.log(response);
      return response.json();
    }).then(response => {
      console.log(response.data);
      this.setState({
        posts: response.data.posts,
      });
    });
  }

  renderPosts = () => {
    const { posts } = this.state;
    return posts.map(({ id, title, content }) => (
      <div key={id}>
        <h1>{title}</h1>
        <p>{content}</p>
        <DeletePost idPost={id} getAllPosts={this.getAllPosts} />
      </div>
    ));
  }

  render() {
    
    return (
      <div>
        <PostForm getAllPosts={this.getAllPosts} />
        {this.renderPosts()}
      </div>
    );
  }
}

export default BlogContainer;
