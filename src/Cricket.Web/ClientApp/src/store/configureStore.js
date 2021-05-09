import { applyMiddleware, compose, createStore } from 'redux';
import { createBrowserHistory } from 'history';
import { routerMiddleware, } from 'connected-react-router';
import thunkMiddleware from 'redux-thunk';
import createRootReducer from './reducers';

// Create browser history to use in the Redux store
export const history = createBrowserHistory({
    basename: document.getElementsByTagName('base')[0].getAttribute('href')
});

const configureStore = (preloadedState) => {
    const enhancers = [];
    const isDevelopment = process.env.NODE_ENV === 'development';
    if (isDevelopment && typeof window !== 'undefined' && window.devToolsExtension) {
        enhancers.push(window.devToolsExtension());
    }

    const store = createStore(
        createRootReducer(history),
        preloadedState,
        compose(
            applyMiddleware(
                thunkMiddleware,
                routerMiddleware(history)
            ),
        )
    );

    return store;
}

export default configureStore;
