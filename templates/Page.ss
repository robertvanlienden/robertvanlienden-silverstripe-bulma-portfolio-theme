<!DOCTYPE html>
<html lang="$ContentLocale">
<head>
    <% base_tag %>
    <title>$Title - $SiteConfig.Title</title>
    <meta name="description" content="$MetaDescription">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <% require css('themes/silverstripe-bulma-portfolio-theme/bundles/main.css') %>
</head>
<body class="flex-grow">
<header class="p-4">
    <% include Nav %>
</header>
<div class="content mb-0">
    <% if $SiteConfig.AddonsHeaderFeatureFlag && $HeaderImage && not $HeaderDisabled %>
        <div class="page-header columns is-flex is-vcentered is-centered is-align-content-center m-0" style="background-image: url('$HeaderImage.FocusCropHeight(900).FocusCropWidth(1300).URL');">
            <div class="column is-half has-text-centered <% if $DarkContent %>has-text-black<% else %>has-text-light<% end_if%>">
                <h2 class="<% if $DarkContent %>has-text-gray-darker<% else %>has-text-white<% end_if %>">$HeaderTitle</h2>
                <div>
                    $HeaderContent
                </div>
                <% if $HeaderButtonLink %>
                    <div class="pt-6">
                        <strong>
                        <a href="$HeaderButtonLink.LinkURL" class="button p-5 is-secondary">$HeaderButtonLink.Title
                            <i class="fa-regular fa-circle-right pl-2"></i>
                        </a>
                        </strong>
                    </div>
                <% end_if %>
            </div>
        </div>
    <% end_if %>
    <div class="has-background-light">
        <section class="container p-4">
            <% if $Level(2) %>
                <div class="py-4">
                    $Breadcrumbs
                </div>
            <% end_if %>
            <div>
                $Layout
            </div>
        </section>
    </div>
    </div>
</div>
<% include Footer %>
<% require javascript('themes/silverstripe-bulma-portfolio-theme/bundles/app.js') %>
</body>
</html>
