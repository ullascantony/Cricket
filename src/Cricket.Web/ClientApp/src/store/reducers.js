import { combineReducers } from 'redux';
import { connectRouter } from 'connected-react-router';
import * as worldCupPlayer from './worldCupPlayerReducer';

const createRootReducer = (history) => combineReducers({
    router: connectRouter(history),
    worldCupPlayer: worldCupPlayer.reducer
});

export default createRootReducer;
