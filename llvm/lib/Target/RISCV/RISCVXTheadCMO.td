let hasSideEffects = 1, mayLoad = 0, mayStore = 0 in
class RVInst_ar<RISCVOpcode opcode, string opcodestr, bits<7> funct7, bits<5> funct5> 
    : RVInst<(outs GPR: $rd), (ins GPR: $rs1), opcodestr, "$rs1", [], InstFormatR> {
  
  bits<5> rs1;
  bits<5> rd = 0;
  bits<3> funct3 = 0b000;

  let Inst{31-25} = funct7;
  let Inst{24-20} = funct5;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-7} = rd;
  let Opcode = opcode.Value;
}

def DCACHE_CALL : RVInst_nr<OPC_CUSTOM_0, "dcache.call", 0b0000000, 0b00001>, Sched<[]>;
def : Pat<(int_riscv_dcache_call), (DCACHE_CALL)>;

def DCACHE_CIALL : RVInst_nr<OPC_CUSTOM_0, "dcache.ciall", 0b0000000, 0b00011>, Sched<[]>;
def : Pat<(int_riscv_dcache_ciall), (DCACHE_CIALL)>;

def DCACHE_CIPA : RVInst_ar<OPC_CUSTOM_0, "dcache.cipa", 0b0000001, 0b01011>, Sched<[]>;
def : PatGpr<int_riscv_dcache_cipa, DCACHE_CIPA>;

def DCACHE_CISW : RVInst_ar<OPC_CUSTOM_0, "dcache.cisw", 0b0000001, 0b00011>, Sched<[]>;
def : PatGpr<int_riscv_dcache_cisw, DCACHE_CISW>;

def DCACHE_CIVA : RVInst_ar<OPC_CUSTOM_0, "dcache.civa", 0b0000001, 0b00111>, Sched<[]>;
def : PatGpr<int_riscv_dcache_civa, DCACHE_CIVA>;

def DCACHE_CPA : RVInst_ar<OPC_CUSTOM_0, "dcache.cpa", 0b0000001, 0b01001>, Sched<[]>;
def : PatGpr<int_riscv_dcache_cpa, DCACHE_CPA>;

def DCACHE_CPAL1 : RVInst_ar<OPC_CUSTOM_0, "dcache.cpal1", 0b0000001, 0b01000>, Sched<[]>;
def : PatGpr<int_riscv_dcache_cpal1, DCACHE_CPAL1>;

def DCACHE_CSW : RVInst_ar<OPC_CUSTOM_0, "dcache.csw", 0b0000001, 0b00001>, Sched<[]>;
def : PatGpr<int_riscv_dcache_csw, DCACHE_CSW>;