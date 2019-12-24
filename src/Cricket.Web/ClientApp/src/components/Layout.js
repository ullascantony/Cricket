import $ from 'jquery';
import React from 'react';
import { Link } from 'react-router-dom';
import { Navbar, Nav, NavItem } from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';

const navItemClicked = function () {
    if ($('.navbar-xs').is(':visible')) {
        $('.navbar-toggler').click();
    }
};

export default props => ([
    <Navbar.Collapse className="flex-column show" id="site-left" key="1">
        <div className="navbar navbar-dark bg-dark navbar-site">
            <Navbar.Header className="navbar-header">
                <Link className="navbar-brand" title="International Cricket Council" to={'/'}>
                    <img alt="ICC Logo" className="navbar-brand-image" src="images/icc_logo.png" />
                    <span className="navbar-brand-text">ICC</span>
                </Link>
            </Navbar.Header>
            <Nav className="navbar-nav">
                <LinkContainer to={'/'} onClick={navItemClicked} exact>
                    <NavItem>
                        Home
                    </NavItem>
                </LinkContainer>
                <LinkContainer to={'/worldcupplayer'} onClick={navItemClicked}>
                    <NavItem>
                        World cup players
                    </NavItem>
                </LinkContainer>
                <LinkContainer to={'/about'} onClick={navItemClicked}>
                    <NavItem>
                        About
                    </NavItem>
                </LinkContainer>
            </Nav>
        </div>
    </Navbar.Collapse>
    ,
    <div className="flex-column" id="site-right" key="2">
        <div className="navbar navbar-dark bg-dark navbar-xs">
            <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#site-left" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon" />
            </button>
        </div>
        <main role="main" className="container-content-group">
            <div className="container-contents">
                {props.children}
            </div>
            <footer className="footer footer-site">
                <span className="copyright" title="International Cricket Council">&copy; 2019 ICC</span>
                <Link to={'/'}>Home</Link>&nbsp;&nbsp;|&nbsp;&nbsp;
                <Link to={'/about'}>About</Link>
            </footer>
        </main>
    </div>
]);
