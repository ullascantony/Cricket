import $ from 'jquery';
import popper from 'popper.js';
import bootstrap from 'bootstrap';
import React from 'react';
import { Route } from 'react-router';
import Layout from './components/Layout';
import Home from './components/Home';
import About from './components/About';
import WorldCupPlayer from './components/WorldCupPlayer';

window.$ = $;
window.popper = popper;
window.bootstrap = bootstrap;

export default () => (
    <Layout>
        <Route exact path='/' component={Home} />
        <Route exact path='/about' component={About} />
        <Route path='/worldcupplayer/:page?' component={WorldCupPlayer} />
    </Layout>
);
