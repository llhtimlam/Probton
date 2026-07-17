module cocotb_iverilog_dump();
initial begin
    string dumpfile_path;    if ($value$plusargs("dumpfile_path=%s", dumpfile_path)) begin
        $dumpfile(dumpfile_path);
    end else begin
        $dumpfile("/workspace/cocotb/sim_build/wave_controller.fst");
    end
    $dumpvars(0, wave_controller);
end
endmodule
