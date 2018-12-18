import React from 'react';
import PropTypes from 'prop-types';

class PostForm extends React.Component {
  constructor(props) {
    super(props);

    this.handleSubmit = this.handleSubmit.bind(this);
    this.state={
      title: '',
      content: '',
    };
  }

  handleChange = (e) => {
    const { value, name } = e.target;
    
    this.setState({
      [name]: value,
    });
  }

  handleSubmit = (event) => {
    event.preventDefault();
    const { title, content } = this.state;

    if (title && content) {      
      fetch('/graphql', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json'},
        body: JSON.stringify({
          query: `
            mutation {
              createPost(input: {
                title: "${title}",
                content: "${content}"
              }) {
                post{
                  id,
                  title
                }
              }
            }
          `,
        })
      }).then(response => {
        // get the response back and return it as json
        console.log(response);
        return response.json();
      }).then(response => {
        // set the response somewhere accessible to the component
        console.log(response);
        if (!response.errors) {
          alert(`${response.data.createPost.post.title} was created`);
          this.setState({
            title: '',
            content: '',
          })
          this.props.getAllPosts();
        } else {
          alert('Error creating post');
        }
      });
    } else {
      alert('Missing title or content!');
    }
  }
  
  render() {
    const { title, content } = this.state;
    return(
      <form onSubmit={this.handleSubmit}>
        <div>
          <input
            name="title"
            value={title}
            onChange={this.handleChange}
            placeholder="title"
          />
        </div>
        <div>
          <textarea
            name="content"
            onChange={this.handleChange}
            placeholder="Post content"
            value={content}
          >
          </textarea>
        </div>
        <div>
          <input type="submit" value="Save Post" />
        </div>
      </form>
    );
  }
}

PostForm.propType = {
  getAllPosts: PropTypes.func.isRequired,
};

export default PostForm;
