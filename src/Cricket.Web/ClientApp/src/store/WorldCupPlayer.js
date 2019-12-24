const requestWorldCupPlayerType = 'REQUEST_WORLD_CUP_PLAYER';
const receiveWorldCupPlayerType = 'RECEIVE_WORLD_CUP_PLAYER';
const initialState = { players: [], chartData: null, isLoading: false };

export const actionCreators = {
    requestWorldCupPlayer: page => async (dispatch, getState) => {
        if (page === getState().worldCupPlayer.page) {
            return; // Avoid duplicate requests
        }

        dispatch({ type: requestWorldCupPlayerType, page });

        let searchResponse = await fetch('api/WorldCupPlayer/Search', {
            method: 'POST',
            headers: new Headers({ 'Content-Type': 'application/json; charset=utf-8' }),
            body: JSON.stringify({
                worldCupPlayerID: null,
                teamID: null,
                dateOfBirthRangeBegin: null,
                dateOfBirthRangeEnd: null,
                includeArchived: false,
                rows: 10,
                page: page
            })
        });
        let players = await searchResponse.json();

        let chartDataResponse = await fetch('api/WorldCupPlayer/ChartData', {
            method: 'GET',
            headers: new Headers({ 'Content-Type': 'application/json; charset=utf-8' })
        });
        let chartData = await chartDataResponse.json();

        dispatch({ type: receiveWorldCupPlayerType, page, players, chartData });
    }
};

export const reducer = (state, action) => {
    state = state || initialState;

    if (action.type === requestWorldCupPlayerType) {
        return {
            ...state,
            page: action.page,
            isLoading: true
        };
    }

    if (action.type === receiveWorldCupPlayerType) {
        return {
            ...state,
            page: action.page,
            players: action.players,
            chartData: action.chartData,
            isLoading: false
        };
    }

    return state;
};
