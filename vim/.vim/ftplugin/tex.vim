set tw=80

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

let g:grammalecte_disable_rules="apostrophe_typographique apostrophe_typographique_après_t espaces_début_ligne espaces_milieu_ligne espaces_fin_de_ligne typo_points_suspension1 typo_tiret_incise nbsp_avant_double_ponctuation nbsp_avant_deux_points nbsp_après_chevrons_ouvrants nbsp_avant_chevrons_fermants1 unit_nbsp_avant_unités1 unit_nbsp_avant_unités2 unit_nbsp_avant_unités3 typo_espace_manquant_après1 typo_espace_manquant_après2"

let g:vimtex_quickfix_ignore_filters=[
      \'specifier changed to',
      \]

let g:vimtex_quickfix_autoclose_after_keystrokes=2
