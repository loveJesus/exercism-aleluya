# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
namespace eval resistorColor {
    proc colorCode {args_aleluya} {
        set idx_aleluya [lsearch -exact [colors] $args_aleluya]
        if {$idx_aleluya < 0} {
            error "Invalid color: $args_aleluya"
        }
        return  $idx_aleluya
    }

    proc colors {} {
        return "black brown red orange yellow green blue violet grey white" 
    }
}
