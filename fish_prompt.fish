function fish_prompt
  # Cache exit status
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
	set -g __fish_prompt_char '#'
      case '*'
	set -g __fish_prompt_char 'λ'
    end
  end

  # Setup colors
  set -l normal (set_color normal)
  set -l white (set_color white)
  set -l turquoise (set_color cyan)
  set -l orange (set_color yellow)
  set -l hotpink (set_color red)
  set -l blue (set_color blue)
  set -l limegreen (set_color green)
  set -l purple (set_color magenta)
 
  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color 5fdfff
  set -g __fish_git_prompt_color_flags df5f00
  set -g __fish_git_prompt_color_prefix white
  set -g __fish_git_prompt_color_suffix white
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true 
 
  # Line 1
  echo -n $white'╭─'$hotpink$USER$white' at '$orange$__fish_prompt_hostname$white' in '$limegreen(pwd)$turquoise
  __fish_git_prompt " (%s)"
  echo

  # Line 2
  echo -n $white'╰'
  # support for virtual env name
  if set -q VIRTUAL_ENV
      echo -n "($turquoise"(basename "$VIRTUAL_ENV")"$white)"
  end
  echo -n $white'─'$__fish_prompt_char $normal
end


