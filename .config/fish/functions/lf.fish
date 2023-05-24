function lf
    set tempfile (mktemp)
    command lf -command "map Q \$echo \$PWD >$tempfile; lf -remote \"send \$id quit\"" $argv

    if test -f "$tempfile" -a (cat -- "$tempfile") != (echo -n (pwd))
        cd -- (cat "$tempfile"); or return
    end
    command rm -f -- "$tempfile" ^/dev/null
end
