const requestWorldCupPlayerType = 'REQUEST_WORLD_CUP_PLAYER';
const receiveWorldCupPlayerType = 'RECEIVE_WORLD_CUP_PLAYER';

const initialState = {
    chartData: {},
    players: [],
    isLoading: false
};

export const actionCreators = {
    requestWorldCupPlayer: page => async (dispatch, getState) => {
        if (page === getState().worldCupPlayer.page) {
            return; // Avoid duplicate requests
        }

        dispatch({ type: requestWorldCupPlayerType, page });

        let chartDataResponse = await fetch('api/WorldCupPlayer/ChartData', {
            method: 'GET',
            headers: new Headers({ 'Content-Type': 'application/json; charset=utf-8' })
        });
        let chartData = await chartDataResponse.json();

        let searchResponse = await fetch('api/WorldCupPlayer/Search', {
            method: 'POST',
            headers: new Headers({ 'Content-Type': 'application/json; charset=utf-8' }),
            body: JSON.stringify({
                includeArchived: false,
                rows: 10,
                page: (page - 1)
            })
        });
        let players = await searchResponse.json();

        dispatch({ type: receiveWorldCupPlayerType, page, chartData, players });
    }
};

export const reducer = (state = initialState, action) => {
    if (action.type === requestWorldCupPlayerType) {
        return {
            ...state,
            page: action.page,
            isLoading: true
        };
    }
    else if (action.type === receiveWorldCupPlayerType) {
        return {
            ...state,
            page: action.page,
            chartData: action.chartData,
            players: action.players,
            isLoading: false
        };
    }

    return state;
};
