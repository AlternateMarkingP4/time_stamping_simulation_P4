#include "includes/headers.p4"
#include "includes/parser.p4"
#include "includes/intrinsic.p4"

//header_type standart_intrinsic_metadata_t {
//    fields {
//		ingress_port : 8;
//   	 }
//}


//metadata standart_intrinsic_metadata_t ingress_metadata;
metadata ingress_intrinsic_metadata_t intrinsic_metadata;

action _drop() {
    drop();
}

action _set_port(dst) {
    modify_field(standard_metadata.egress_spec,dst);
}

table set_port {
    reads {
        intrinsic_metadata.time_of_day : ternary;
		standard_metadata.ingress_port : exact;		
    }
    actions {
        _set_port;
        _drop;
    }
    size: 256;
}



control ingress {
	apply(set_port);
}

control egress {
	//apply(set_port);
}