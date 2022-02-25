var HelloWord = createReactClass({
  propTypes: {
    greeting: PropTypes.node
  },

  render: function() {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
      </React.Fragment>
    );
  }
});

