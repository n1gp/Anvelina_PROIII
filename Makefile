## Quartus tools quartus_sh and quartus_cpf must be in your path

BOARD := Orion
RXTX1 := 65a6
RXTX2 := 5596
RXTX3 := 44c7
RXTX4 := 85b7


all:
	rm -rf RBFS/*
	mkdir -p RBFS/$(RXTX1) RBFS/$(RXTX2) RBFS/$(RXTX3) RBFS/$(RXTX4)
	@sed -i "0,/\[6] = 16'h..../s//\[6] = 16'h$(RXTX1)/" Ethernet/phy_cfg.v
	quartus_sh --flow compile $(BOARD)
	cp $(BOARD).rbf RBFS/$(RXTX1)/$(BOARD)_$(RXTX1).rbf
	cp Ethernet/phy_cfg.v $(BOARD).*.rpt RBFS/$(RXTX1)/
	@sed -i "0,/\[6] = 16'h..../s//\[6] = 16'h$(RXTX2)/" Ethernet/phy_cfg.v
	quartus_sh --flow compile $(BOARD)
	cp $(BOARD).rbf RBFS/$(RXTX2)/$(BOARD)_$(RXTX2).rbf
	cp Ethernet/phy_cfg.v $(BOARD).*.rpt RBFS/$(RXTX2)/
	@sed -i "0,/\[6] = 16'h..../s//\[6] = 16'h$(RXTX3)/" Ethernet/phy_cfg.v
	quartus_sh --flow compile $(BOARD)
	cp $(BOARD).rbf RBFS/$(RXTX3)/$(BOARD)_$(RXTX3).rbf
	cp Ethernet/phy_cfg.v $(BOARD).*.rpt RBFS/$(RXTX3)/
	@sed -i "0,/\[6] = 16'h..../s//\[6] = 16'h$(RXTX4)/" Ethernet/phy_cfg.v
	quartus_sh --flow compile $(BOARD)
	cp $(BOARD).rbf RBFS/$(RXTX4)/$(BOARD)_$(RXTX4).rbf
	cp Ethernet/phy_cfg.v $(BOARD).*.rpt RBFS/$(RXTX4)/

.PHONY: all
