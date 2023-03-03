<%-- NOTE: Before including this, you will need to wrap the include in a with block  --%>
<% if $MoreThanOnePage %>
    <p class="pagination mt-3">
        <% if $NotFirstPage %>
            <a class="prev button is-primary" href="{$PrevLink}">&larr;</a>
        <% end_if %>

        <% loop $PaginationSummary(4) %>
            <% if $CurrentBool %>
                <b>$PageNum</b>
            <% else %>
                <% if $Link %>
                    <a href="$Link" class="is-size-4">$PageNum</a>
                <% else %>
                    <span>...</span>
                <% end_if %>
            <% end_if %>
        <% end_loop %>

        <% if $NotLastPage %>
            <a class="next button is-primary" href="{$NextLink}">&rarr;</a>
        <% end_if %>
    </p>
<% end_if %>

