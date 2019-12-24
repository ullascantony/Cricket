import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Bar } from 'react-chartjs-2';
import { actionCreators } from '../store/WorldCupPlayer';

class WorldCupPlayer extends Component {
    componentWillMount() {
        const page = parseInt(this.props.match.params.page, 10) || 0;
        this.props.requestWorldCupPlayer(page);
    }

    componentWillReceiveProps(nextProps) {
        const page = parseInt(nextProps.match.params.page, 10) || 0;
        this.props.requestWorldCupPlayer(page);
    }

    formatDate(value) {
        const date = new Date(value);
        if (date !== null) {
            const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
            return `${date.getFullYear()}-${months[date.getMonth()]}-${(date.getDate() < 10 ? '0' + date.getDate() : date.getDate())}`;
        }
    }

    renderChart(props) {
        const chartOptions = {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        };

        let chartData = {
            datasets: [{
                borderWidth: 6,
                label: 'Batsmen'
            }]
        };

        if (props.chartData !== null) {
            chartData.labels = props.chartData.teamNames;
            chartData.datasets[0].backgroundColor = props.chartData.teamPrimaryColours;
            chartData.datasets[0].borderColor = props.chartData.teamSecondaryColours;
            chartData.datasets[0].data = props.chartData.teamPlayerCounts;
        }

        return (
            <Bar className="chart-canvas" id="ChartCanvas" data={chartData} options={chartOptions} />
        );
    }

    renderTable(props) {
        return (
            <div className="table-container">
                <table className="table table-bordered table-striped table-nowrap table-site">
                    <thead>
                        <tr>
                            <th>Player name</th>
                            <th>Date of birth</th>
                            <th>Team name</th>
                            <th className="text-right">Matches</th>
                            <th className="text-right">Innings</th>
                            <th className="text-right">Runs</th>
                            <th className="text-right">Highest</th>
                            <th className="text-right">Centuries</th>
                            <th className="text-right">Fifties</th>
                            <th className="text-right">Fours</th>
                            <th className="text-right">Sixes</th>
                            <th className="text-right">Average</th>
                            <th className="text-right">Strike rate</th>
                        </tr>
                    </thead>
                    <tbody>
                        {
                            props.players.map(player => (
                                <tr key={player.worldCupPlayerID}>
                                    <td>{`${player.givenName} ${player.familyName}`}</td>
                                    <td>{this.formatDate(player.dateOfBirth)}</td>
                                    <td>{player.teamName}</td>
                                    <td className="text-right">{player.matches}</td>
                                    <td className="text-right">{player.innings}</td>
                                    <td className="text-right">{player.runs}</td>
                                    <td className="text-right">{`${player.highest}${player.highestIsNotOut ? '*' : ''}`}</td>
                                    <td className="text-right">{player.centuries}</td>
                                    <td className="text-right">{player.fifties}</td>
                                    <td className="text-right">{player.fours}</td>
                                    <td className="text-right">{player.sixes}</td>
                                    <td className="text-right">{player.average}</td>
                                    <td className="text-right">{player.strikeRate}</td>
                                </tr>
                            ))
                        }
                    </tbody>
                </table>
            </div>
        );
    }

    renderPaging(props) {
        let resultCount = 0;
        if (props.players.length > 0) {
            resultCount = props.players[0].resultCount;
        }
        return (
            <div className="table-site-pagination text-center">
                <div className="btn-group">
                    {
                        props.isLoading ?
                            <span className="text-center">Loading...</span> :
                            [
                                <Link className={"btn btn-site" + (props.page <= 0 ? ' disabled' : '')} title="Click to load previous page" to={`/worldcupplayer/${(props.page - 1)}`} key="1">&lt; &lt;</Link>
                                ,
                                <Link className={"btn btn-site" + (((props.page + 1) * 10) >= resultCount ? ' disabled' : '')} title="Click to load next page" to={`/worldcupplayer/${(props.page + 1)}`} key="2">&gt; &gt;</Link>
                            ]
                    }
                </div>
            </div>
        );
    }

    render() {
        return (
            <div className="text-left">
                <h1>World cup players</h1>
                <h5>View analytical charts based ICC World Cup player data which is also available as a grid</h5>
                <hr />
                <div className="contents">
                    <div className="accordion" id="AccordionResults">
                        <div className="card card-expandable">
                            <div className="card-header" id="HeadingChart" tabIndex="0" title="Click to collapse/expand section" data-toggle="collapse" data-target="#PanelChart" aria-expanded="true" aria-controls="PanelChart">
                                <span className="card-header-caption">Batsmen by team</span>
                            </div>
                            <div id="PanelChart" className="collapse show" aria-labelledby="HeadingChart" data-parent="#AccordionResults">
                                <div className="card-body">
                                    {this.renderChart(this.props)}
                                </div>
                            </div>
                        </div>
                        <div className="card card-expandable">
                            <div className="card-header collapsed" id="HeadingData" tabIndex="0" title="Click to collapse/expand section" data-toggle="collapse" data-target="#PanelData" aria-expanded="false" aria-controls="PanelData">
                                <span className="card-header-caption">Tabular data</span>
                            </div>
                            <div id="PanelData" className="collapse" aria-labelledby="HeadingData" data-parent="#AccordionResults">
                                <div className="card-body">
                                    <div className="contents">
                                        {this.renderTable(this.props)}
                                        {this.renderPaging(this.props)}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <Link className="btn btn-secondary" name="Home" title="Click to navigate back home" to={'/'}>&lt; &lt; Home</Link>
            </div>
        );
    }
}

export default connect(
    state => state.worldCupPlayer,
    dispatch => bindActionCreators(actionCreators, dispatch)
)(WorldCupPlayer);
