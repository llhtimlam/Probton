module cocotb_iverilog_dump();
initial begin
    string dumpfile_path;    if ($value$plusargs("dumpfile_path=%s", dumpfile_path)) begin
        $dumpfile(dumpfile_path);
    end else begin
        $dumpfile("C:\\Users\\User\\Documents\\GitHub\\Probton\\cocotb\\sim_build\\signal_processor.fst");
    end
    $dumpvars(0, signal_processor);
end
endmodule
