import $ from 'jquery';
import React, { Component } from 'react';
import { ConnectedRouter } from 'connected-react-router';
import { Route } from 'react-router';
import Layout from './components/Layout';
import Home from './components/Home';
import About from './components/About';
import WorldCupPlayer from './components/WorldCupPlayer';

window.$ = $;

class App extends Component {
    render = () => {
        return (
            <ConnectedRouter history={this.props.history} context={this.props.context}>
                <Layout>
                    <Route exact name='home' path='/' component={Home} />
                    <Route name='about' path='/about' component={About} />
                    <Route name='worldcupplayer' path='/worldcupplayer/:page?' component={WorldCupPlayer} />
                </Layout>
            </ConnectedRouter>
        );
    }
}

export default App;