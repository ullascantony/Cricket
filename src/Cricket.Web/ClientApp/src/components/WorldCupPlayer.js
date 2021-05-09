import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Accordion, Card } from 'react-bootstrap';
import { Bar } from 'react-chartjs-2';
import { actionCreators } from '../store/worldCupPlayerReducer';
import { getPager } from '../common/pagination';

class WorldCupPlayer extends Component {
    componentDidMount = () => {
        const page = parseInt(this.props.match.params.page, 10) || 0;
        this.props.requestWorldCupPlayer(page);
    }

    componentDidUpdate = () => {
        const page = parseInt(this.props.match.params.page, 10) || 0;
        this.props.requestWorldCupPlayer(page);
    }

    formatDate = (value) => {
        const date = new Date(value);
        if (date !== null) {
            const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
            return `${date.getFullYear()}-${months[date.getMonth()]}-${(date.getDate() < 10 ? '0' + date.getDate() : date.getDate())}`;
        }
    }

    renderChart = () => {
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

        if (this.props.chartData !== null) {
            chartData.labels = this.props.chartData.teamNames;
            chartData.datasets[0].backgroundColor = this.props.chartData.teamPrimaryColours;
            chartData.datasets[0].borderColor = this.props.chartData.teamSecondaryColours;
            chartData.datasets[0].data = this.props.chartData.teamPlayerCounts;
        }

        return (
            <Bar className="chart-canvas" id="ChartCanvas" data={chartData} options={chartOptions} />
        );
    }

    renderTable = () => {
        return (
            <table className="table table-nowrap table-site">
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
                        this.props.players.map(player => (
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
        );
    }

    renderPaging = () => {
        let resultCount = 0;
        if (this.props.players.length > 0) {
            resultCount = this.props.players[0].resultCount;
        }

        let playerPager = getPager(
            resultCount,
            (this.props.page > 1 ? this.props.page : 1),
            10,
            'player',
            'players');

        return (
            <nav aria-label="Pagination">
                <ul className="pagination pagination-site" role="navigation">
                    <li className={this.props.isLoading || playerPager.currentPage <= 1 ? 'page-item disabled' : 'page-item'} title={playerPager.currentPage > 1 ? 'Go to first page' : ''}>
                        <Link className="page-link" to={`/worldcupplayer/${1}`}>|&lt;</Link>
                    </li>
                    <li className={this.props.isLoading || playerPager.currentPage <= 1 ? 'page-item disabled' : 'page-item'} title={playerPager.currentPage > 1 ? 'Go to previous page (' + (playerPager.currentPage - 1) + ')' : ''}>
                        <Link className="page-link" to={`/worldcupplayer/${(playerPager.currentPage - 1)}`}>&lt;&lt;</Link>
                    </li>
                    {playerPager.pages.map(playerPage =>
                        <li key={playerPage} className={this.props.isLoading || playerPager.currentPage === playerPage ? 'page-item current' : 'page-item'} title={playerPager.currentPage !== playerPage ? 'Go to page ' + playerPage : 'Current page is ' + playerPage}>
                            <Link className="page-link" to={`/worldcupplayer/${playerPage}`}>{playerPage}</Link>
                        </li>
                    )}
                    <li className={this.props.isLoading || playerPager.currentPage >= playerPager.totalPages ? 'page-item disabled' : 'page-item'} title={playerPager.currentPage < playerPager.totalPages ? 'Go to next page (' + (playerPager.currentPage + 1) + ')' : ''}>
                        <Link className="page-link" to={`/worldcupplayer/${(playerPager.currentPage + 1)}`}>&gt;&gt;</Link>
                    </li>
                    <li className={this.props.isLoading || playerPager.currentPage >= playerPager.totalPages ? 'page-item disabled' : 'page-item'} title={playerPager.currentPage < playerPager.totalPages ? 'Go to last page (' + (playerPager.totalPages) + ')' : ''}>
                        <Link className="page-link" to={`/worldcupplayer/${(playerPager.totalPages)}`}>&gt;|</Link>
                    </li>
                </ul>
                <span className="pagination-summary" title={playerPager.pagerSummary}>{playerPager.pagerSummary}</span>
            </nav>
        );
    }

    render = () => {
        return (
            <div className="text-left">
                <h1>World cup players</h1>
                <h5>View analytical charts based ICC World Cup player data which is also available as a grid</h5>
                <hr />
                <div className="contents">
                    <Accordion defaultActiveKey="0" id="AccordionResults">
                        <Card className="card-expandable">
                            <Accordion.Toggle as={Card.Header} eventKey="0" id="HeadingChart" tabIndex="0" title="Click to collapse/expand section" variant="link">
                                <span className="card-header-caption">Batsmen by team</span>
                            </Accordion.Toggle>
                            <Accordion.Collapse eventKey="0" id="PanelChart" aria-labelledby="HeadingDevelopment">
                                <Card.Body>
                                    {this.renderChart(this.props)}
                                </Card.Body>
                            </Accordion.Collapse>
                        </Card>
                        <Card className="card-expandable">
                            <Accordion.Toggle as={Card.Header} eventKey="1" id="HeadingData" tabIndex="0" title="Click to collapse/expand section" variant="link">
                                <span className="card-header-caption">Tabular data</span>
                            </Accordion.Toggle>
                            <Accordion.Collapse eventKey="1" id="PanelData" aria-labelledby="HeadingSourceCode">
                                <Card.Body>
                                    <div className="table-container">
                                        {this.renderTable(this.props)}
                                    </div>
                                    {this.renderPaging(this.props)}
                                </Card.Body>
                            </Accordion.Collapse>
                        </Card>
                    </Accordion>
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
