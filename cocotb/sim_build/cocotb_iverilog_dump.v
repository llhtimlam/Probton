module cocotb_iverilog_dump();
initial begin
    string dumpfile_path;    if ($value$plusargs("dumpfile_path=%s", dumpfile_path)) begin
        $dumpfile(dumpfile_path);
    end else begin
        $dumpfile("C:\\Users\\User\\Documents\\GitHub\\Probton\\cocotb\\sim_build\\spi_regs.fst");
    end
    $dumpvars(0, spi_regs);
end
endmodule
