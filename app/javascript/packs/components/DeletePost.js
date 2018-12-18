import React from 'react';
import PropTypes from 'prop-types';

class DeletePost extends React.Component {
  handleDelete = () => {
    console.log("Delete ");
    fetch('/graphql', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify({
        query: `
          mutation {
            deletePost(input: {
              id: ${this.props.idPost}
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
      console.log(response.data);
      this.props.getAllPosts();
    });
  }

  render() {
    return(
      <button onClick={this.handleDelete} >
        Eliminar
      </button>
    );
  }
}

DeletePost.propType = {
  idPost: PropTypes.number.isRequired,
  getAllPosts: PropTypes.func.isRequired,
};

export default DeletePost;

