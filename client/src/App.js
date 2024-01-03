import React, { Component } from 'react';
import { Jumbotron, Grid, Row } from 'react-bootstrap';
import ConnectedSearch from './components/Search.js'
import logo from './components/ed_logo.png'
import './index.css';




class App extends Component {

    constructor() {
    super();
    this.state = {
      publicIP: null,
      dbcon:null,
    };
  }
    componentDidMount() {
    // Fetch the publicIP from the server API using the built-in fetch API
    fetch('/api/ip')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        this.setState({ publicIP: data['fileContents']+"" });
        this.setState({dbcon: data['dbsite']+""});
      })
      .catch(error => {
        console.error('Error fetching publicIP:', error);
      });
  }
    render() {

        const jumStyle = {
            backgroundColor: 'rgb(54,69,79)',
            color:'white'
        }

        return (
            <div className='App'>
            <div>
            <Grid>
            <Row>
            <Jumbotron style={jumStyle} className='jumbotron'>
            <div>
            <h1> Educative Sample App </h1>
            <img src={logo} alt="not found"/>
            </div>
            <p> Author Repository </p>
            {this.state.publicIP && <p>IP address of the instance is: {this.state.publicIP}</p>}
            {this.state.dbcon && <p>{this.state.dbcon}</p>}
            </Jumbotron>
            </Row>
            <Row>
            {this.props.children}
            </Row>
            </Grid>
            <ConnectedSearch />
            </div>
            </div>
        );
    }
}

export default App;
