**IMPORTANT: This document is work in progress. Information isn't accurate.**

The Dropbox API changes frequently, this document indicates what endpoints
have been implemented.

Full moon means fully implemented. Half moon means that the basic functionality
of the endpoint has been implemented but some options may be missing.

## Files namespace

API call | Status
--- | :---:
`copy` | 🌕
`create_folder` | 🌕
`delete` | 🌕
`download` | 🌔
`get_metadata` | 🌕
`get_preview` | 🌕
`get_temporary_link` | 🌕
`get_thumbnail` | 🌕
`list_folder` | 🌕
`list_folder_continue` | 🌕
`move` | 🌕
`search` | 🌕
`upload` | 🌕

## Sharing namespace
API call | Status
--- | :---:
`add_folder_member` | 🌕
`create_shared_link_with_settings` | 🌓
`list_folder_members` | 🌓
`list_shared_links` | 🌕
`share_folder` | 🌕

## Users namespace

API call | Status
--- | :---:
`get_account` | 🌕
`get_account_batch` | 🌑
`get_current_account` | 🌑
`get_space_usage` | 🌑


## Dropbox Business API
Unfortunately, none of the Dropbox Business endpoints have been implemented.
If this is a problem for you, please [open an
issue](https://github.com/Jesus/dropbox_api_v2/issues/new).
