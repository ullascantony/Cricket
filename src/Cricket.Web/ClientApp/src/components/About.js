import $ from 'jquery';
import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import { Accordion, Card } from 'react-bootstrap';

class About extends Component {
    render = () => {
        return (
            <div className="text-left">
                <h1>About</h1>
                <h5>This single-page application is built with following technologies and libraries</h5>
                <hr />
                <div className="contents">
                    <Accordion defaultActiveKey="0" id="AccordionAbout">
                        <Card className="card-expandable">
                            <Accordion.Toggle as={Card.Header} eventKey="0" id="HeadingDevelopment" tabIndex="0" title="Click to collapse/expand section" variant="link">
                                <span className="card-header-caption">Development tools and resources</span>
                            </Accordion.Toggle>
                            <Accordion.Collapse className="card-collapse" eventKey="0" id="PanelDevelopment" aria-labelledby="HeadingDevelopment">
                                <Card.Body>
                                    <ul type="square">
                                        <li>This portal is entirely build using <a href="https://stackshare.io/microsoft/microsoft" rel="noopener noreferrer" target="_blank">Microsoft Tech Stack</a> and some popular open source libraries.</li>
                                        <li>The server-side code is developed using <a href="https://docs.microsoft.com/en-us/aspnet/core/?view=aspnetcore-2.1" rel="noopener noreferrer" target="_blank">ASP.NET Core</a> and <a href="https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide" rel="noopener noreferrer" target="_blank">C#</a>.</li>
                                        <li><a href="https://www.microsoft.com/en-us/sql-server" rel="noopener noreferrer" target="_blank">SQL Server</a> relational database access is setup using micro ORM <a href="https://dapper-tutorial.net" rel="noopener noreferrer" target="_blank">Dapper</a>.</li>
                                        <li>UX is build using <a href="https://reactjs.org" rel="noopener noreferrer" target="_blank">React</a> with <a href="https://redux.js.org" rel="noopener noreferrer" target="_blank">Redux</a>.</li>
                                        <li>Responsive layout and styling of the UX is done using <a href="https://getbootstrap.com" rel="noopener noreferrer" target="_blank">Twitter Bootstrap</a>.</li>
                                        <li>Chart generation is done using <a href="https://www.chartjs.org" rel="noopener noreferrer" target="_blank">Chart JS</a>.</li>
                                    </ul>
                                </Card.Body>
                            </Accordion.Collapse>
                        </Card>
                        <Card className="card-expandable">
                            <Accordion.Toggle as={Card.Header} eventKey="1" id="HeadingSourceCode" tabIndex="0" title="Click to collapse/expand section" variant="link">
                                <span className="card-header-caption">Source code</span>
                            </Accordion.Toggle>
                            <Accordion.Collapse className="card-collapse" eventKey="1" id="PanelSourceCode" aria-labelledby="HeadingSourceCode">
                                <Card.Body>
                                    You can download the Source Code of this application using below button.
                                    <hr />
                                    <a className="btn btn-secondary" name="GetSource" title="Click to download source code" href="files/Cricket_Source_Code.zip" download>Download source code</a>
                                </Card.Body>
                            </Accordion.Collapse>
                        </Card>
                        <Card className="card-expandable">
                            <Accordion.Toggle as={Card.Header} eventKey="2" id="HeadingAuthor" tabIndex="0" title="Click to collapse/expand section" variant="link">
                                <span className="card-header-caption">Author</span>
                            </Accordion.Toggle>
                            <Accordion.Collapse className="card-collapse" eventKey="2" id="PanelAuthor" aria-labelledby="HeadingAuthor">
                                <Card.Body>
                                    <b>Ullas Chacko Antony</b>
                                    <br />
                                    .NET Lead Developer
                                    <hr />
                                    <a href="mailto:ullascantony@yahoo.com?subject=Cricket%20portal">ullascantony@yahoo.com</a>
                                    <br />
                                    0452 630 302
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

export default connect()(About);
