import $ from 'jquery';
import React, { Component } from 'react';
import { withRouter, Link } from 'react-router-dom';
import { Navbar, Nav } from 'react-bootstrap';

const navItemClicked = () => {
    if (!$('.navbar-toggler').hasClass('collapsed')) {
        $(this).removeClass('active').addClass('active');
    }
};

const navTogglerClicked = () => {
    if ($('.navbar-collapse').hasClass('show')) {
        $('.navbar-toggler').addClass('collapsed');
        $('.navbar-collapse').removeClass('show');
        $('#site-left').hide();
    } else {
        $('.navbar-toggler').removeClass('collapsed');
        $('.navbar-collapse').addClass('show');
        $('#site-left').show();
    }
};

class Layout extends Component {
    render = () => {
        return [
            <Navbar.Collapse className="flex-column show" id="site-left" key="1">
                <Navbar className="navbar-site" variant="dark">
                    <div className="navbar-header">
                        <Navbar.Brand title="International Cricket Council" href="#home">
                            <img alt="ICC Logo" className="navbar-brand-image" src="images/icc_logo.png" />
                            <span className="navbar-brand-text">ICC</span>
                        </Navbar.Brand>
                    </div>
                    <Nav className="nav">
                        <Link to="/" className={this.props.location.pathname === '/' ? 'nav-link active' : 'nav-link'} onClick={navItemClicked} exact="true">
                            Home
                        </Link>
                        <Link to="/worldcupplayer" className={this.props.location.pathname.indexOf('/worldcupplayer') >= 0 ? 'nav-link active' : 'nav-link'} onClick={navItemClicked}>
                            World cup players
                        </Link>
                        <Link to="/about" className={this.props.location.pathname === '/about' ? 'nav-link active' : 'nav-link'} onClick={navItemClicked}>
                            About
                        </Link>
                    </Nav>
                </Navbar>
            </Navbar.Collapse>
            ,
            <div className="flex-column" id="site-right" key="2">
                <div className="navbar navbar-dark navbar-xs">
                    <Navbar.Toggle label="Toggle navigation" onClick={navTogglerClicked}>
                        <span className="navbar-toggler-icon" />
                    </Navbar.Toggle>
                </div>
                <main role="main" className="container-content-group">
                    <div className="container-contents">
                        {this.props.children}
                    </div>
                    <footer className="footer footer-site">
                        <span className="copyright" title="International Cricket Council">&copy; 2019 ICC</span>
                        <Link to={'/'} exact="true">Home</Link>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <Link to={'/about'}>About</Link>
                    </footer>
                </main>
            </div>
        ]
    };
}

export default withRouter(Layout);
