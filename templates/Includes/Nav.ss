<nav class="navbar is-transparent" role="navigation" aria-label="main navigation">
    <div class="container is-widescreen">
        <div class="navbar-brand pr-5">
            <% if $SiteConfig.HeaderLogo %>
                <a href="$BaseHref">
                    <img src="$SiteConfig.HeaderLogo.ScaleHeight(125).URL" alt="$SiteConfig.HeaderLogo.ScaleHeight(125).Title" height="125">
                </a>
            <% else %>
                <div class="is-align-text-center p-4">
                    <a href="$BaseHref">
                        <h3>$SiteConfig.Title</h3>
                    </a>
                    <% if $SiteConfig.Tagline %>
                        <h4 class="subtitle is-4">$SiteConfig.Tagline</h4>
                    <% end_if %>
                </div>
            <% end_if %>
            <a role="button" class="navbar-burger has-text-centered" aria-label="menu" aria-expanded="false" data-target="navbar">
                Menu
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>
        <div class="pt-6">
            <div id="navbar" class="navbar-menu is-block-desktop">
                <div class="navbar-start">
                    <% loop $Menu(1) %>
                        <a href="$Link" title="Go to the $Title page" class="navbar-item<% if $isCurrent %> has-text-weight-bold<% else %> has-text-weight-medium<% end_if %>">
                            $MenuTitle
                        </a>
                        <% if $Children %>
                            <div class="navbar-item has-dropdown is-hoverable">
                                <div class="navbar-link is-hidden-touch">

                                </div>
                                <div class="navbar-dropdown">
                                    <% loop $Children %>
                                        <a href="$Link" class="navbar-item<% if $isCurrent %>  has-text-weight-bold<% else %> has-text-weight-medium<% end_if %>">
                                            $MenuTitle
                                        </a>
                                    <% end_loop %>
                                </div>
                            </div>
                        <% end_if %>
                    <% end_loop %>
                </div>
            </div>
        </div>
    </div>
</nav>
