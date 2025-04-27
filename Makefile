## Modify phy timings and build multiple firmware images
## Quartus tools quartus_sh and quartus_cpf must be in your path
## The sed should work for both 9021 & 9031 in phy_cfg.v
#	@sed -i "/\[6] <= 16'h..../s//\[6] <= 16'h$(RXTX1)/g" Ethernet/phy_cfg.v

BOARD := Orion
ARXTX1 := 65a6
ARXTX2 := 5596
ARXTX3 := 44c7
ARXTX4 := 85b7

ORIG := 0000_00_01111_01111
BRXTX1 := 0000_00_01000_00111
BRXTX2 := 0000_00_01111_01110
BRXTX3 := 0000_00_11110_00011
BRXTX4 := 0000_00_01111_01010

all:
	rm -rf RBFS/*
	mkdir -p RBFS/$(ARXTX1) RBFS/$(ARXTX2) RBFS/$(ARXTX3) RBFS/$(ARXTX4)
	@sed -i "0,/\[6] <= 16'h..../s//\[6] <= 16'h$(ARXTX1)/" Ethernet/phy_cfg.v
	@sed -i "0,/\[2] <= 16'b.................../s//\[2] <= 16'b$(BRXTX1)/" Ethernet/phy_cfg.v
	quartus_sh --flow compile $(BOARD)
	cp $(BOARD).rbf RBFS/$(ARXTX1)/$(BOARD)_$(ARXTX1).rbf
	cp Ethernet/phy_cfg.v $(BOARD).*.rpt RBFS/$(ARXTX1)/
	@sed -i "0,/\[6] <= 16'h..../s//\[6] <= 16'h$(ARXTX2)/" Ethernet/phy_cfg.v
	@sed -i "0,/\[2] <= 16'b.................../s//\[2] <= 16'b$(BRXTX2)/" Ethernet/phy_cfg.v
	quartus_sh --flow compile $(BOARD)
	cp $(BOARD).rbf RBFS/$(ARXTX2)/$(BOARD)_$(ARXTX2).rbf
	cp Ethernet/phy_cfg.v $(BOARD).*.rpt RBFS/$(ARXTX2)/
	@sed -i "0,/\[6] <= 16'h..../s//\[6] <= 16'h$(ARXTX3)/" Ethernet/phy_cfg.v
	@sed -i "0,/\[2] <= 16'b.................../s//\[2] <= 16'b$(BRXTX3)/" Ethernet/phy_cfg.v
	quartus_sh --flow compile $(BOARD)
	cp $(BOARD).rbf RBFS/$(ARXTX3)/$(BOARD)_$(ARXTX3).rbf
	cp Ethernet/phy_cfg.v $(BOARD).*.rpt RBFS/$(ARXTX3)/
	@sed -i "0,/\[6] <= 16'h..../s//\[6] <= 16'h$(ARXTX4)/" Ethernet/phy_cfg.v
	@sed -i "0,/\[2] <= 16'b.................../s//\[2] <= 16'b$(BRXTX4)/" Ethernet/phy_cfg.v
	quartus_sh --flow compile $(BOARD)
	cp $(BOARD).rbf RBFS/$(ARXTX4)/$(BOARD)_$(ARXTX4).rbf
	cp Ethernet/phy_cfg.v $(BOARD).*.rpt RBFS/$(ARXTX4)/

.PHONY: all
