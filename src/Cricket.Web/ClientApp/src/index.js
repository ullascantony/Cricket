import 'bootstrap/dist/css/bootstrap.css';
import './index.css';
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider, ReactReduxContext } from 'react-redux';
import App from './App';
import registerServiceWorker from './registerServiceWorker';
import configureStore, { history } from './store/configureStore';

// Get the application-wide store instance, prepopulating with state from the server where available.
const store = configureStore(window.initialReduxState);

ReactDOM.render(
    <Provider store={store} context={ReactReduxContext}>
        <App history={history} context={ReactReduxContext} />
    </Provider>,
    document.getElementById('root'));

registerServiceWorker();
