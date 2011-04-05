# 1 "exceptions.c"
# 1 "/Users/rianders/projects/ArduinoRicklon/hardware/pic32/cores/pic32//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "exceptions.c"
# 40 "exceptions.c"
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 1 3
# 97 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/proc/p32mx795f512l.h" 1 3
# 15 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/proc/p32mx795f512l.h" 3
extern volatile unsigned int WDTCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned WDTCLR:1;
    unsigned :1;
    unsigned SWDTPS0:1;
    unsigned SWDTPS1:1;
    unsigned SWDTPS2:1;
    unsigned SWDTPS3:1;
    unsigned SWDTPS4:1;
    unsigned :8;
    unsigned ON:1;
  };
  struct {
    unsigned :2;
    unsigned WDTPSTA:5;
  };
  struct {
    unsigned w:32;
  };
} __WDTCONbits_t;
extern volatile __WDTCONbits_t WDTCONbits __asm__ ("WDTCON") __attribute__((section("sfrs")));
extern volatile unsigned int WDTCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int WDTCONSET __attribute__((section("sfrs")));
extern volatile unsigned int WDTCONINV __attribute__((section("sfrs")));
extern volatile unsigned int RTCCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RTCOE:1;
    unsigned HALFSEC:1;
    unsigned RTCSYNC:1;
    unsigned RTCWREN:1;
    unsigned :2;
    unsigned RTCCLKON:1;
    unsigned RTSECSEL:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned CAL:10;
  };
  struct {
    unsigned w:32;
  };
} __RTCCONbits_t;
extern volatile __RTCCONbits_t RTCCONbits __asm__ ("RTCCON") __attribute__((section("sfrs")));
extern volatile unsigned int RTCCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int RTCCONSET __attribute__((section("sfrs")));
extern volatile unsigned int RTCCONINV __attribute__((section("sfrs")));
extern volatile unsigned int RTCALRM __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ARPT:8;
    unsigned AMASK:4;
    unsigned ALRMSYNC:1;
    unsigned PIV:1;
    unsigned CHIME:1;
    unsigned ALRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __RTCALRMbits_t;
extern volatile __RTCALRMbits_t RTCALRMbits __asm__ ("RTCALRM") __attribute__((section("sfrs")));
extern volatile unsigned int RTCALRMCLR __attribute__((section("sfrs")));
extern volatile unsigned int RTCALRMSET __attribute__((section("sfrs")));
extern volatile unsigned int RTCALRMINV __attribute__((section("sfrs")));
extern volatile unsigned int RTCTIME __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :8;
    unsigned SEC01:4;
    unsigned SEC10:4;
    unsigned MIN01:4;
    unsigned MIN10:4;
    unsigned HR01:4;
    unsigned HR10:4;
  };
  struct {
    unsigned w:32;
  };
} __RTCTIMEbits_t;
extern volatile __RTCTIMEbits_t RTCTIMEbits __asm__ ("RTCTIME") __attribute__((section("sfrs")));
extern volatile unsigned int RTCTIMECLR __attribute__((section("sfrs")));
extern volatile unsigned int RTCTIMESET __attribute__((section("sfrs")));
extern volatile unsigned int RTCTIMEINV __attribute__((section("sfrs")));
extern volatile unsigned int RTCDATE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned WDAY01:4;
    unsigned :4;
    unsigned DAY01:4;
    unsigned DAY10:4;
    unsigned MONTH01:4;
    unsigned MONTH10:4;
    unsigned YEAR01:4;
    unsigned YEAR10:4;
  };
  struct {
    unsigned w:32;
  };
} __RTCDATEbits_t;
extern volatile __RTCDATEbits_t RTCDATEbits __asm__ ("RTCDATE") __attribute__((section("sfrs")));
extern volatile unsigned int RTCDATECLR __attribute__((section("sfrs")));
extern volatile unsigned int RTCDATESET __attribute__((section("sfrs")));
extern volatile unsigned int RTCDATEINV __attribute__((section("sfrs")));
extern volatile unsigned int ALRMTIME __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :8;
    unsigned SEC01:4;
    unsigned SEC10:4;
    unsigned MIN01:4;
    unsigned MIN10:4;
    unsigned HR01:4;
    unsigned HR10:4;
  };
  struct {
    unsigned w:32;
  };
} __ALRMTIMEbits_t;
extern volatile __ALRMTIMEbits_t ALRMTIMEbits __asm__ ("ALRMTIME") __attribute__((section("sfrs")));
extern volatile unsigned int ALRMTIMECLR __attribute__((section("sfrs")));
extern volatile unsigned int ALRMTIMESET __attribute__((section("sfrs")));
extern volatile unsigned int ALRMTIMEINV __attribute__((section("sfrs")));
extern volatile unsigned int ALRMDATE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned WDAY01:4;
    unsigned :4;
    unsigned DAY01:4;
    unsigned DAY10:4;
    unsigned MONTH01:4;
    unsigned MONTH10:4;
  };
  struct {
    unsigned w:32;
  };
} __ALRMDATEbits_t;
extern volatile __ALRMDATEbits_t ALRMDATEbits __asm__ ("ALRMDATE") __attribute__((section("sfrs")));
extern volatile unsigned int ALRMDATECLR __attribute__((section("sfrs")));
extern volatile unsigned int ALRMDATESET __attribute__((section("sfrs")));
extern volatile unsigned int ALRMDATEINV __attribute__((section("sfrs")));
extern volatile unsigned int T1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned TSYNC:1;
    unsigned :1;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned :1;
    unsigned TGATE:1;
    unsigned :3;
    unsigned TWIP:1;
    unsigned TWDIS:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS:2;
    unsigned :7;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T1CONbits_t;
extern volatile __T1CONbits_t T1CONbits __asm__ ("T1CON") __attribute__((section("sfrs")));
extern volatile unsigned int T1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int T1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int T1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int TMR1 __attribute__((section("sfrs")));
extern volatile unsigned int TMR1CLR __attribute__((section("sfrs")));
extern volatile unsigned int TMR1SET __attribute__((section("sfrs")));
extern volatile unsigned int TMR1INV __attribute__((section("sfrs")));
extern volatile unsigned int PR1 __attribute__((section("sfrs")));
extern volatile unsigned int PR1CLR __attribute__((section("sfrs")));
extern volatile unsigned int PR1SET __attribute__((section("sfrs")));
extern volatile unsigned int PR1INV __attribute__((section("sfrs")));
extern volatile unsigned int T2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned :1;
    unsigned T32:1;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned TCKPS2:1;
    unsigned TGATE:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS:3;
    unsigned :6;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T2CONbits_t;
extern volatile __T2CONbits_t T2CONbits __asm__ ("T2CON") __attribute__((section("sfrs")));
extern volatile unsigned int T2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int T2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int T2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int TMR2 __attribute__((section("sfrs")));
extern volatile unsigned int TMR23 __attribute__((section("sfrs")));
extern volatile unsigned int TMR23CLR __attribute__((section("sfrs")));
extern volatile unsigned int TMR2CLR __attribute__((section("sfrs")));
extern volatile unsigned int TMR23SET __attribute__((section("sfrs")));
extern volatile unsigned int TMR2SET __attribute__((section("sfrs")));
extern volatile unsigned int TMR23INV __attribute__((section("sfrs")));
extern volatile unsigned int TMR2INV __attribute__((section("sfrs")));
extern volatile unsigned int PR2 __attribute__((section("sfrs")));
extern volatile unsigned int PR23 __attribute__((section("sfrs")));
extern volatile unsigned int PR23CLR __attribute__((section("sfrs")));
extern volatile unsigned int PR2CLR __attribute__((section("sfrs")));
extern volatile unsigned int PR23SET __attribute__((section("sfrs")));
extern volatile unsigned int PR2SET __attribute__((section("sfrs")));
extern volatile unsigned int PR23INV __attribute__((section("sfrs")));
extern volatile unsigned int PR2INV __attribute__((section("sfrs")));
extern volatile unsigned int T3CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned :2;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned TCKPS2:1;
    unsigned TGATE:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS:3;
    unsigned :6;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T3CONbits_t;
extern volatile __T3CONbits_t T3CONbits __asm__ ("T3CON") __attribute__((section("sfrs")));
extern volatile unsigned int T3CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int T3CONSET __attribute__((section("sfrs")));
extern volatile unsigned int T3CONINV __attribute__((section("sfrs")));
extern volatile unsigned int TMR3 __attribute__((section("sfrs")));
extern volatile unsigned int TMR3CLR __attribute__((section("sfrs")));
extern volatile unsigned int TMR3SET __attribute__((section("sfrs")));
extern volatile unsigned int TMR3INV __attribute__((section("sfrs")));
extern volatile unsigned int PR3 __attribute__((section("sfrs")));
extern volatile unsigned int PR3CLR __attribute__((section("sfrs")));
extern volatile unsigned int PR3SET __attribute__((section("sfrs")));
extern volatile unsigned int PR3INV __attribute__((section("sfrs")));
extern volatile unsigned int T4CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned :1;
    unsigned T32:1;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned TCKPS2:1;
    unsigned TGATE:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS:3;
    unsigned :6;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T4CONbits_t;
extern volatile __T4CONbits_t T4CONbits __asm__ ("T4CON") __attribute__((section("sfrs")));
extern volatile unsigned int T4CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int T4CONSET __attribute__((section("sfrs")));
extern volatile unsigned int T4CONINV __attribute__((section("sfrs")));
extern volatile unsigned int TMR4 __attribute__((section("sfrs")));
extern volatile unsigned int TMR45 __attribute__((section("sfrs")));
extern volatile unsigned int TMR45CLR __attribute__((section("sfrs")));
extern volatile unsigned int TMR4CLR __attribute__((section("sfrs")));
extern volatile unsigned int TMR45SET __attribute__((section("sfrs")));
extern volatile unsigned int TMR4SET __attribute__((section("sfrs")));
extern volatile unsigned int TMR45INV __attribute__((section("sfrs")));
extern volatile unsigned int TMR4INV __attribute__((section("sfrs")));
extern volatile unsigned int PR4 __attribute__((section("sfrs")));
extern volatile unsigned int PR45 __attribute__((section("sfrs")));
extern volatile unsigned int PR45CLR __attribute__((section("sfrs")));
extern volatile unsigned int PR4CLR __attribute__((section("sfrs")));
extern volatile unsigned int PR45SET __attribute__((section("sfrs")));
extern volatile unsigned int PR4SET __attribute__((section("sfrs")));
extern volatile unsigned int PR45INV __attribute__((section("sfrs")));
extern volatile unsigned int PR4INV __attribute__((section("sfrs")));
extern volatile unsigned int T5CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned :2;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned TCKPS2:1;
    unsigned TGATE:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS:3;
    unsigned :6;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T5CONbits_t;
extern volatile __T5CONbits_t T5CONbits __asm__ ("T5CON") __attribute__((section("sfrs")));
extern volatile unsigned int T5CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int T5CONSET __attribute__((section("sfrs")));
extern volatile unsigned int T5CONINV __attribute__((section("sfrs")));
extern volatile unsigned int TMR5 __attribute__((section("sfrs")));
extern volatile unsigned int TMR5CLR __attribute__((section("sfrs")));
extern volatile unsigned int TMR5SET __attribute__((section("sfrs")));
extern volatile unsigned int TMR5INV __attribute__((section("sfrs")));
extern volatile unsigned int PR5 __attribute__((section("sfrs")));
extern volatile unsigned int PR5CLR __attribute__((section("sfrs")));
extern volatile unsigned int PR5SET __attribute__((section("sfrs")));
extern volatile unsigned int PR5INV __attribute__((section("sfrs")));
extern volatile unsigned int IC1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI0:1;
    unsigned ICI1:1;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM:3;
    unsigned :2;
    unsigned ICI:2;
    unsigned :6;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC1CONbits_t;
extern volatile __IC1CONbits_t IC1CONbits __asm__ ("IC1CON") __attribute__((section("sfrs")));
extern volatile unsigned int IC1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int IC1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int IC1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int IC1BUF __attribute__((section("sfrs")));
extern volatile unsigned int IC2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI0:1;
    unsigned ICI1:1;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM:3;
    unsigned :2;
    unsigned ICI:2;
    unsigned :6;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC2CONbits_t;
extern volatile __IC2CONbits_t IC2CONbits __asm__ ("IC2CON") __attribute__((section("sfrs")));
extern volatile unsigned int IC2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int IC2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int IC2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int IC2BUF __attribute__((section("sfrs")));
extern volatile unsigned int IC3CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI0:1;
    unsigned ICI1:1;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM:3;
    unsigned :2;
    unsigned ICI:2;
    unsigned :6;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC3CONbits_t;
extern volatile __IC3CONbits_t IC3CONbits __asm__ ("IC3CON") __attribute__((section("sfrs")));
extern volatile unsigned int IC3CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int IC3CONSET __attribute__((section("sfrs")));
extern volatile unsigned int IC3CONINV __attribute__((section("sfrs")));
extern volatile unsigned int IC3BUF __attribute__((section("sfrs")));
extern volatile unsigned int IC4CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI0:1;
    unsigned ICI1:1;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM:3;
    unsigned :2;
    unsigned ICI:2;
    unsigned :6;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC4CONbits_t;
extern volatile __IC4CONbits_t IC4CONbits __asm__ ("IC4CON") __attribute__((section("sfrs")));
extern volatile unsigned int IC4CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int IC4CONSET __attribute__((section("sfrs")));
extern volatile unsigned int IC4CONINV __attribute__((section("sfrs")));
extern volatile unsigned int IC4BUF __attribute__((section("sfrs")));
extern volatile unsigned int IC5CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI0:1;
    unsigned ICI1:1;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM:3;
    unsigned :2;
    unsigned ICI:2;
    unsigned :6;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC5CONbits_t;
extern volatile __IC5CONbits_t IC5CONbits __asm__ ("IC5CON") __attribute__((section("sfrs")));
extern volatile unsigned int IC5CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int IC5CONSET __attribute__((section("sfrs")));
extern volatile unsigned int IC5CONINV __attribute__((section("sfrs")));
extern volatile unsigned int IC5BUF __attribute__((section("sfrs")));
extern volatile unsigned int OC1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM:3;
    unsigned :10;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC1CONbits_t;
extern volatile __OC1CONbits_t OC1CONbits __asm__ ("OC1CON") __attribute__((section("sfrs")));
extern volatile unsigned int OC1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int OC1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int OC1R __attribute__((section("sfrs")));
extern volatile unsigned int OC1RCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC1RSET __attribute__((section("sfrs")));
extern volatile unsigned int OC1RINV __attribute__((section("sfrs")));
extern volatile unsigned int OC1RS __attribute__((section("sfrs")));
extern volatile unsigned int OC1RSCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC1RSSET __attribute__((section("sfrs")));
extern volatile unsigned int OC1RSINV __attribute__((section("sfrs")));
extern volatile unsigned int OC2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM:3;
    unsigned :10;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC2CONbits_t;
extern volatile __OC2CONbits_t OC2CONbits __asm__ ("OC2CON") __attribute__((section("sfrs")));
extern volatile unsigned int OC2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int OC2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int OC2R __attribute__((section("sfrs")));
extern volatile unsigned int OC2RCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC2RSET __attribute__((section("sfrs")));
extern volatile unsigned int OC2RINV __attribute__((section("sfrs")));
extern volatile unsigned int OC2RS __attribute__((section("sfrs")));
extern volatile unsigned int OC2RSCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC2RSSET __attribute__((section("sfrs")));
extern volatile unsigned int OC2RSINV __attribute__((section("sfrs")));
extern volatile unsigned int OC3CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM:3;
    unsigned :10;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC3CONbits_t;
extern volatile __OC3CONbits_t OC3CONbits __asm__ ("OC3CON") __attribute__((section("sfrs")));
extern volatile unsigned int OC3CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC3CONSET __attribute__((section("sfrs")));
extern volatile unsigned int OC3CONINV __attribute__((section("sfrs")));
extern volatile unsigned int OC3R __attribute__((section("sfrs")));
extern volatile unsigned int OC3RCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC3RSET __attribute__((section("sfrs")));
extern volatile unsigned int OC3RINV __attribute__((section("sfrs")));
extern volatile unsigned int OC3RS __attribute__((section("sfrs")));
extern volatile unsigned int OC3RSCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC3RSSET __attribute__((section("sfrs")));
extern volatile unsigned int OC3RSINV __attribute__((section("sfrs")));
extern volatile unsigned int OC4CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM:3;
    unsigned :10;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC4CONbits_t;
extern volatile __OC4CONbits_t OC4CONbits __asm__ ("OC4CON") __attribute__((section("sfrs")));
extern volatile unsigned int OC4CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC4CONSET __attribute__((section("sfrs")));
extern volatile unsigned int OC4CONINV __attribute__((section("sfrs")));
extern volatile unsigned int OC4R __attribute__((section("sfrs")));
extern volatile unsigned int OC4RCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC4RSET __attribute__((section("sfrs")));
extern volatile unsigned int OC4RINV __attribute__((section("sfrs")));
extern volatile unsigned int OC4RS __attribute__((section("sfrs")));
extern volatile unsigned int OC4RSCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC4RSSET __attribute__((section("sfrs")));
extern volatile unsigned int OC4RSINV __attribute__((section("sfrs")));
extern volatile unsigned int OC5CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM:3;
    unsigned :10;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC5CONbits_t;
extern volatile __OC5CONbits_t OC5CONbits __asm__ ("OC5CON") __attribute__((section("sfrs")));
extern volatile unsigned int OC5CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC5CONSET __attribute__((section("sfrs")));
extern volatile unsigned int OC5CONINV __attribute__((section("sfrs")));
extern volatile unsigned int OC5R __attribute__((section("sfrs")));
extern volatile unsigned int OC5RCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC5RSET __attribute__((section("sfrs")));
extern volatile unsigned int OC5RINV __attribute__((section("sfrs")));
extern volatile unsigned int OC5RS __attribute__((section("sfrs")));
extern volatile unsigned int OC5RSCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC5RSSET __attribute__((section("sfrs")));
extern volatile unsigned int OC5RSINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ACON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C1ACONbits_t;
extern volatile __I2C1ACONbits_t I2C1ACONbits __asm__ ("I2C1ACON") __attribute__((section("sfrs")));
extern volatile unsigned int I2C3CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C3CONbits_t;
extern volatile __I2C3CONbits_t I2C3CONbits __asm__ ("I2C3CON") __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ACONCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C3CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ACONSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C3CONSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ACONINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3CONINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ASTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C1ASTATbits_t;
extern volatile __I2C1ASTATbits_t I2C1ASTATbits __asm__ ("I2C1ASTAT") __attribute__((section("sfrs")));
extern volatile unsigned int I2C3STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C3STATbits_t;
extern volatile __I2C3STATbits_t I2C3STATbits __asm__ ("I2C3STAT") __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ASTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C3STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ASTATSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C3STATSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ASTATINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3STATINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1AADD __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ADD __attribute__((section("sfrs")));
extern volatile unsigned int I2C1AADDCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ADDCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1AADDSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ADDSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1AADDINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ADDINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1AMSK __attribute__((section("sfrs")));
extern volatile unsigned int I2C3MSK __attribute__((section("sfrs")));
extern volatile unsigned int I2C1AMSKCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C3MSKCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1AMSKSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C3MSKSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1AMSKINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3MSKINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ABRG __attribute__((section("sfrs")));
extern volatile unsigned int I2C3BRG __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ABRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C3BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ABRGSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C3BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ABRGINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ATRN __attribute__((section("sfrs")));
extern volatile unsigned int I2C3TRN __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ATRNCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C3TRNCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ATRNSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C3TRNSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ATRNINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3TRNINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ARCV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3RCV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ACON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C2ACONbits_t;
extern volatile __I2C2ACONbits_t I2C2ACONbits __asm__ ("I2C2ACON") __attribute__((section("sfrs")));
extern volatile unsigned int I2C4CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C4CONbits_t;
extern volatile __I2C4CONbits_t I2C4CONbits __asm__ ("I2C4CON") __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ACONCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C4CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ACONSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C4CONSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ACONINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C4CONINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ASTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C2ASTATbits_t;
extern volatile __I2C2ASTATbits_t I2C2ASTATbits __asm__ ("I2C2ASTAT") __attribute__((section("sfrs")));
extern volatile unsigned int I2C4STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C4STATbits_t;
extern volatile __I2C4STATbits_t I2C4STATbits __asm__ ("I2C4STAT") __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ASTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C4STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ASTATSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C4STATSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ASTATINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C4STATINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2AADD __attribute__((section("sfrs")));
extern volatile unsigned int I2C4ADD __attribute__((section("sfrs")));
extern volatile unsigned int I2C2AADDCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C4ADDCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2AADDSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C4ADDSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2AADDINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C4ADDINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2AMSK __attribute__((section("sfrs")));
extern volatile unsigned int I2C4MSK __attribute__((section("sfrs")));
extern volatile unsigned int I2C2AMSKCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C4MSKCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2AMSKSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C4MSKSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2AMSKINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C4MSKINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ABRG __attribute__((section("sfrs")));
extern volatile unsigned int I2C4BRG __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ABRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C4BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ABRGSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C4BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ABRGINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C4BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ATRN __attribute__((section("sfrs")));
extern volatile unsigned int I2C4TRN __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ATRNCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C4TRNCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ATRNSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C4TRNSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ATRNINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C4TRNINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ARCV __attribute__((section("sfrs")));
extern volatile unsigned int I2C4RCV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ACON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C3ACONbits_t;
extern volatile __I2C3ACONbits_t I2C3ACONbits __asm__ ("I2C3ACON") __attribute__((section("sfrs")));
extern volatile unsigned int I2C5CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C5CONbits_t;
extern volatile __I2C5CONbits_t I2C5CONbits __asm__ ("I2C5CON") __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ACONCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C5CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ACONSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C5CONSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ACONINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C5CONINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ASTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C3ASTATbits_t;
extern volatile __I2C3ASTATbits_t I2C3ASTATbits __asm__ ("I2C3ASTAT") __attribute__((section("sfrs")));
extern volatile unsigned int I2C5STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C5STATbits_t;
extern volatile __I2C5STATbits_t I2C5STATbits __asm__ ("I2C5STAT") __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ASTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C5STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ASTATSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C5STATSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ASTATINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C5STATINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3AADD __attribute__((section("sfrs")));
extern volatile unsigned int I2C5ADD __attribute__((section("sfrs")));
extern volatile unsigned int I2C3AADDCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C5ADDCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C3AADDSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C5ADDSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C3AADDINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C5ADDINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3AMSK __attribute__((section("sfrs")));
extern volatile unsigned int I2C5MSK __attribute__((section("sfrs")));
extern volatile unsigned int I2C3AMSKCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C5MSKCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C3AMSKSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C5MSKSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C3AMSKINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C5MSKINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ABRG __attribute__((section("sfrs")));
extern volatile unsigned int I2C5BRG __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ABRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C5BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ABRGSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C5BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ABRGINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C5BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ATRN __attribute__((section("sfrs")));
extern volatile unsigned int I2C5TRN __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ATRNCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C5TRNCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ATRNSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C5TRNSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ATRNINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C5TRNINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C3ARCV __attribute__((section("sfrs")));
extern volatile unsigned int I2C5RCV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C1CONbits_t;
extern volatile __I2C1CONbits_t I2C1CONbits __asm__ ("I2C1CON") __attribute__((section("sfrs")));
extern volatile unsigned int I2C1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C1STATbits_t;
extern volatile __I2C1STATbits_t I2C1STATbits __asm__ ("I2C1STAT") __attribute__((section("sfrs")));
extern volatile unsigned int I2C1STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1STATSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1STATINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ADD __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ADDCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ADDSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ADDINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1MSK __attribute__((section("sfrs")));
extern volatile unsigned int I2C1MSKCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1MSKSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1MSKINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1BRG __attribute__((section("sfrs")));
extern volatile unsigned int I2C1BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1TRN __attribute__((section("sfrs")));
extern volatile unsigned int I2C1TRNCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1TRNSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1TRNINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1RCV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C2CONbits_t;
extern volatile __I2C2CONbits_t I2C2CONbits __asm__ ("I2C2CON") __attribute__((section("sfrs")));
extern volatile unsigned int I2C2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C2STATbits_t;
extern volatile __I2C2STATbits_t I2C2STATbits __asm__ ("I2C2STAT") __attribute__((section("sfrs")));
extern volatile unsigned int I2C2STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2STATSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2STATINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ADD __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ADDCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ADDSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ADDINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2MSK __attribute__((section("sfrs")));
extern volatile unsigned int I2C2MSKCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2MSKSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2MSKINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2BRG __attribute__((section("sfrs")));
extern volatile unsigned int I2C2BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2TRN __attribute__((section("sfrs")));
extern volatile unsigned int I2C2TRNCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2TRNSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2TRNINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2RCV __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ACON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SRXISEL:2;
    unsigned STXISEL:2;
    unsigned :1;
    unsigned MSTEN:1;
    unsigned CKP:1;
    unsigned SSEN:1;
    unsigned CKE:1;
    unsigned SMP:1;
    unsigned MODE16:1;
    unsigned MODE32:1;
    unsigned DISSDO:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned ENHBUF:1;
    unsigned SPIFE:1;
    unsigned :6;
    unsigned FRMCNT:3;
    unsigned FRMSYPW:1;
    unsigned MSSEN:1;
    unsigned FRMPOL:1;
    unsigned FRMSYNC:1;
    unsigned FRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI1ACONbits_t;
extern volatile __SPI1ACONbits_t SPI1ACONbits __asm__ ("SPI1ACON") __attribute__((section("sfrs")));
extern volatile unsigned int SPI3CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SRXISEL:2;
    unsigned STXISEL:2;
    unsigned :1;
    unsigned MSTEN:1;
    unsigned CKP:1;
    unsigned SSEN:1;
    unsigned CKE:1;
    unsigned SMP:1;
    unsigned MODE16:1;
    unsigned MODE32:1;
    unsigned DISSDO:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned ENHBUF:1;
    unsigned SPIFE:1;
    unsigned :6;
    unsigned FRMCNT:3;
    unsigned FRMSYPW:1;
    unsigned MSSEN:1;
    unsigned FRMPOL:1;
    unsigned FRMSYNC:1;
    unsigned FRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI3CONbits_t;
extern volatile __SPI3CONbits_t SPI3CONbits __asm__ ("SPI3CON") __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ACONCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI3CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ACONSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI3CONSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ACONINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI3CONINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ASTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SPIRBF:1;
    unsigned SPITBF:1;
    unsigned :1;
    unsigned SPITBE:1;
    unsigned :1;
    unsigned SPIRBE:1;
    unsigned SPIROV:1;
    unsigned SRMT:1;
    unsigned SPITUR:1;
    unsigned :2;
    unsigned SPIBUSY:1;
    unsigned :4;
    unsigned TXBUFELM:5;
    unsigned :3;
    unsigned RXBUFELM:5;
  };
  struct {
    unsigned w:32;
  };
} __SPI1ASTATbits_t;
extern volatile __SPI1ASTATbits_t SPI1ASTATbits __asm__ ("SPI1ASTAT") __attribute__((section("sfrs")));
extern volatile unsigned int SPI3STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SPIRBF:1;
    unsigned SPITBF:1;
    unsigned :1;
    unsigned SPITBE:1;
    unsigned :1;
    unsigned SPIRBE:1;
    unsigned SPIROV:1;
    unsigned SRMT:1;
    unsigned SPITUR:1;
    unsigned :2;
    unsigned SPIBUSY:1;
    unsigned :4;
    unsigned TXBUFELM:5;
    unsigned :3;
    unsigned RXBUFELM:5;
  };
  struct {
    unsigned w:32;
  };
} __SPI3STATbits_t;
extern volatile __SPI3STATbits_t SPI3STATbits __asm__ ("SPI3STAT") __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ASTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI3STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ASTATSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI3STATSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ASTATINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI3STATINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ABUF __attribute__((section("sfrs")));
extern volatile unsigned int SPI3BUF __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ABRG __attribute__((section("sfrs")));
extern volatile unsigned int SPI3BRG __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ABRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI3BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ABRGSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI3BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI1ABRGINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI3BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ACON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SRXISEL:2;
    unsigned STXISEL:2;
    unsigned :1;
    unsigned MSTEN:1;
    unsigned CKP:1;
    unsigned SSEN:1;
    unsigned CKE:1;
    unsigned SMP:1;
    unsigned MODE16:1;
    unsigned MODE32:1;
    unsigned DISSDO:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned ENHBUF:1;
    unsigned SPIFE:1;
    unsigned :6;
    unsigned FRMCNT:3;
    unsigned FRMSYPW:1;
    unsigned MSSEN:1;
    unsigned FRMPOL:1;
    unsigned FRMSYNC:1;
    unsigned FRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI2ACONbits_t;
extern volatile __SPI2ACONbits_t SPI2ACONbits __asm__ ("SPI2ACON") __attribute__((section("sfrs")));
extern volatile unsigned int SPI2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SRXISEL:2;
    unsigned STXISEL:2;
    unsigned :1;
    unsigned MSTEN:1;
    unsigned CKP:1;
    unsigned SSEN:1;
    unsigned CKE:1;
    unsigned SMP:1;
    unsigned MODE16:1;
    unsigned MODE32:1;
    unsigned DISSDO:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned ENHBUF:1;
    unsigned SPIFE:1;
    unsigned :6;
    unsigned FRMCNT:3;
    unsigned FRMSYPW:1;
    unsigned MSSEN:1;
    unsigned FRMPOL:1;
    unsigned FRMSYNC:1;
    unsigned FRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI2CONbits_t;
extern volatile __SPI2CONbits_t SPI2CONbits __asm__ ("SPI2CON") __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ACONCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ACONSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ACONINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ASTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SPIRBF:1;
    unsigned SPITBF:1;
    unsigned :1;
    unsigned SPITBE:1;
    unsigned :1;
    unsigned SPIRBE:1;
    unsigned SPIROV:1;
    unsigned SRMT:1;
    unsigned SPITUR:1;
    unsigned :2;
    unsigned SPIBUSY:1;
    unsigned :4;
    unsigned TXBUFELM:5;
    unsigned :3;
    unsigned RXBUFELM:5;
  };
  struct {
    unsigned w:32;
  };
} __SPI2ASTATbits_t;
extern volatile __SPI2ASTATbits_t SPI2ASTATbits __asm__ ("SPI2ASTAT") __attribute__((section("sfrs")));
extern volatile unsigned int SPI2STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SPIRBF:1;
    unsigned SPITBF:1;
    unsigned :1;
    unsigned SPITBE:1;
    unsigned :1;
    unsigned SPIRBE:1;
    unsigned SPIROV:1;
    unsigned SRMT:1;
    unsigned SPITUR:1;
    unsigned :2;
    unsigned SPIBUSY:1;
    unsigned :4;
    unsigned TXBUFELM:5;
    unsigned :3;
    unsigned RXBUFELM:5;
  };
  struct {
    unsigned w:32;
  };
} __SPI2STATbits_t;
extern volatile __SPI2STATbits_t SPI2STATbits __asm__ ("SPI2STAT") __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ASTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI2STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ASTATSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI2STATSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ASTATINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI2STATINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ABUF __attribute__((section("sfrs")));
extern volatile unsigned int SPI2BUF __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ABRG __attribute__((section("sfrs")));
extern volatile unsigned int SPI2BRG __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ABRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI2BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ABRGSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI2BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI2ABRGINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI2BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ACON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SRXISEL:2;
    unsigned STXISEL:2;
    unsigned :1;
    unsigned MSTEN:1;
    unsigned CKP:1;
    unsigned SSEN:1;
    unsigned CKE:1;
    unsigned SMP:1;
    unsigned MODE16:1;
    unsigned MODE32:1;
    unsigned DISSDO:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned ENHBUF:1;
    unsigned SPIFE:1;
    unsigned :6;
    unsigned FRMCNT:3;
    unsigned FRMSYPW:1;
    unsigned MSSEN:1;
    unsigned FRMPOL:1;
    unsigned FRMSYNC:1;
    unsigned FRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI3ACONbits_t;
extern volatile __SPI3ACONbits_t SPI3ACONbits __asm__ ("SPI3ACON") __attribute__((section("sfrs")));
extern volatile unsigned int SPI4CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SRXISEL:2;
    unsigned STXISEL:2;
    unsigned :1;
    unsigned MSTEN:1;
    unsigned CKP:1;
    unsigned SSEN:1;
    unsigned CKE:1;
    unsigned SMP:1;
    unsigned MODE16:1;
    unsigned MODE32:1;
    unsigned DISSDO:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned ENHBUF:1;
    unsigned SPIFE:1;
    unsigned :6;
    unsigned FRMCNT:3;
    unsigned FRMSYPW:1;
    unsigned MSSEN:1;
    unsigned FRMPOL:1;
    unsigned FRMSYNC:1;
    unsigned FRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI4CONbits_t;
extern volatile __SPI4CONbits_t SPI4CONbits __asm__ ("SPI4CON") __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ACONCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI4CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ACONSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI4CONSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ACONINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI4CONINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ASTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SPIRBF:1;
    unsigned SPITBF:1;
    unsigned :1;
    unsigned SPITBE:1;
    unsigned :1;
    unsigned SPIRBE:1;
    unsigned SPIROV:1;
    unsigned SRMT:1;
    unsigned SPITUR:1;
    unsigned :2;
    unsigned SPIBUSY:1;
    unsigned :4;
    unsigned TXBUFELM:5;
    unsigned :3;
    unsigned RXBUFELM:5;
  };
  struct {
    unsigned w:32;
  };
} __SPI3ASTATbits_t;
extern volatile __SPI3ASTATbits_t SPI3ASTATbits __asm__ ("SPI3ASTAT") __attribute__((section("sfrs")));
extern volatile unsigned int SPI4STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SPIRBF:1;
    unsigned SPITBF:1;
    unsigned :1;
    unsigned SPITBE:1;
    unsigned :1;
    unsigned SPIRBE:1;
    unsigned SPIROV:1;
    unsigned SRMT:1;
    unsigned SPITUR:1;
    unsigned :2;
    unsigned SPIBUSY:1;
    unsigned :4;
    unsigned TXBUFELM:5;
    unsigned :3;
    unsigned RXBUFELM:5;
  };
  struct {
    unsigned w:32;
  };
} __SPI4STATbits_t;
extern volatile __SPI4STATbits_t SPI4STATbits __asm__ ("SPI4STAT") __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ASTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI4STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ASTATSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI4STATSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ASTATINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI4STATINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ABUF __attribute__((section("sfrs")));
extern volatile unsigned int SPI4BUF __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ABRG __attribute__((section("sfrs")));
extern volatile unsigned int SPI4BRG __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ABRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI4BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ABRGSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI4BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI3ABRGINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI4BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SRXISEL:2;
    unsigned STXISEL:2;
    unsigned :1;
    unsigned MSTEN:1;
    unsigned CKP:1;
    unsigned SSEN:1;
    unsigned CKE:1;
    unsigned SMP:1;
    unsigned MODE16:1;
    unsigned MODE32:1;
    unsigned DISSDO:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned ENHBUF:1;
    unsigned SPIFE:1;
    unsigned :6;
    unsigned FRMCNT:3;
    unsigned FRMSYPW:1;
    unsigned MSSEN:1;
    unsigned FRMPOL:1;
    unsigned FRMSYNC:1;
    unsigned FRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI1CONbits_t;
extern volatile __SPI1CONbits_t SPI1CONbits __asm__ ("SPI1CON") __attribute__((section("sfrs")));
extern volatile unsigned int SPI1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI1STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SPIRBF:1;
    unsigned SPITBF:1;
    unsigned :1;
    unsigned SPITBE:1;
    unsigned :1;
    unsigned SPIRBE:1;
    unsigned SPIROV:1;
    unsigned SRMT:1;
    unsigned SPITUR:1;
    unsigned :2;
    unsigned SPIBUSY:1;
    unsigned :4;
    unsigned TXBUFELM:5;
    unsigned :3;
    unsigned RXBUFELM:5;
  };
  struct {
    unsigned w:32;
  };
} __SPI1STATbits_t;
extern volatile __SPI1STATbits_t SPI1STATbits __asm__ ("SPI1STAT") __attribute__((section("sfrs")));
extern volatile unsigned int SPI1STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI1STATSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI1STATINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI1BUF __attribute__((section("sfrs")));
extern volatile unsigned int SPI1BRG __attribute__((section("sfrs")));
extern volatile unsigned int SPI1BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI1BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI1BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U1AMODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN0:1;
    unsigned UEN1:1;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :5;
    unsigned UEN:2;
    unsigned :3;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U1AMODEbits_t;
extern volatile __U1AMODEbits_t U1AMODEbits __asm__ ("U1AMODE") __attribute__((section("sfrs")));
extern volatile unsigned int U1MODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN0:1;
    unsigned UEN1:1;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :5;
    unsigned UEN:2;
    unsigned :3;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U1MODEbits_t;
extern volatile __U1MODEbits_t U1MODEbits __asm__ ("U1MODE") __attribute__((section("sfrs")));
extern volatile unsigned int U1AMODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U1MODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U1AMODESET __attribute__((section("sfrs")));
extern volatile unsigned int U1MODESET __attribute__((section("sfrs")));
extern volatile unsigned int U1AMODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U1MODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U1ASTA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U1ASTAbits_t;
extern volatile __U1ASTAbits_t U1ASTAbits __asm__ ("U1ASTA") __attribute__((section("sfrs")));
extern volatile unsigned int U1STA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U1STAbits_t;
extern volatile __U1STAbits_t U1STAbits __asm__ ("U1STA") __attribute__((section("sfrs")));
extern volatile unsigned int U1ASTACLR __attribute__((section("sfrs")));
extern volatile unsigned int U1STACLR __attribute__((section("sfrs")));
extern volatile unsigned int U1ASTASET __attribute__((section("sfrs")));
extern volatile unsigned int U1STASET __attribute__((section("sfrs")));
extern volatile unsigned int U1ASTAINV __attribute__((section("sfrs")));
extern volatile unsigned int U1STAINV __attribute__((section("sfrs")));
extern volatile unsigned int U1ATXREG __attribute__((section("sfrs")));
extern volatile unsigned int U1TXREG __attribute__((section("sfrs")));
extern volatile unsigned int U1ARXREG __attribute__((section("sfrs")));
extern volatile unsigned int U1RXREG __attribute__((section("sfrs")));
extern volatile unsigned int U1ABRG __attribute__((section("sfrs")));
extern volatile unsigned int U1BRG __attribute__((section("sfrs")));
extern volatile unsigned int U1ABRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1ABRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U1BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U1ABRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U1BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U1BMODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned :4;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :10;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U1BMODEbits_t;
extern volatile __U1BMODEbits_t U1BMODEbits __asm__ ("U1BMODE") __attribute__((section("sfrs")));
extern volatile unsigned int U4MODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned :4;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :10;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U4MODEbits_t;
extern volatile __U4MODEbits_t U4MODEbits __asm__ ("U4MODE") __attribute__((section("sfrs")));
extern volatile unsigned int U1BMODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U4MODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U1BMODESET __attribute__((section("sfrs")));
extern volatile unsigned int U4MODESET __attribute__((section("sfrs")));
extern volatile unsigned int U1BMODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U4MODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U1BSTA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U1BSTAbits_t;
extern volatile __U1BSTAbits_t U1BSTAbits __asm__ ("U1BSTA") __attribute__((section("sfrs")));
extern volatile unsigned int U4STA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U4STAbits_t;
extern volatile __U4STAbits_t U4STAbits __asm__ ("U4STA") __attribute__((section("sfrs")));
extern volatile unsigned int U1BSTACLR __attribute__((section("sfrs")));
extern volatile unsigned int U4STACLR __attribute__((section("sfrs")));
extern volatile unsigned int U1BSTASET __attribute__((section("sfrs")));
extern volatile unsigned int U4STASET __attribute__((section("sfrs")));
extern volatile unsigned int U1BSTAINV __attribute__((section("sfrs")));
extern volatile unsigned int U4STAINV __attribute__((section("sfrs")));
extern volatile unsigned int U1BTXREG __attribute__((section("sfrs")));
extern volatile unsigned int U4TXREG __attribute__((section("sfrs")));
extern volatile unsigned int U1BRXREG __attribute__((section("sfrs")));
extern volatile unsigned int U4RXREG __attribute__((section("sfrs")));
extern volatile unsigned int U1BBRG __attribute__((section("sfrs")));
extern volatile unsigned int U4BRG __attribute__((section("sfrs")));
extern volatile unsigned int U1BBRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U4BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1BBRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U4BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U1BBRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U4BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U2AMODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN0:1;
    unsigned UEN1:1;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :5;
    unsigned UEN:2;
    unsigned :3;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U2AMODEbits_t;
extern volatile __U2AMODEbits_t U2AMODEbits __asm__ ("U2AMODE") __attribute__((section("sfrs")));
extern volatile unsigned int U3MODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN0:1;
    unsigned UEN1:1;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :5;
    unsigned UEN:2;
    unsigned :3;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U3MODEbits_t;
extern volatile __U3MODEbits_t U3MODEbits __asm__ ("U3MODE") __attribute__((section("sfrs")));
extern volatile unsigned int U2AMODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U3MODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U2AMODESET __attribute__((section("sfrs")));
extern volatile unsigned int U3MODESET __attribute__((section("sfrs")));
extern volatile unsigned int U2AMODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U3MODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U2ASTA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U2ASTAbits_t;
extern volatile __U2ASTAbits_t U2ASTAbits __asm__ ("U2ASTA") __attribute__((section("sfrs")));
extern volatile unsigned int U3STA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U3STAbits_t;
extern volatile __U3STAbits_t U3STAbits __asm__ ("U3STA") __attribute__((section("sfrs")));
extern volatile unsigned int U2ASTACLR __attribute__((section("sfrs")));
extern volatile unsigned int U3STACLR __attribute__((section("sfrs")));
extern volatile unsigned int U2ASTASET __attribute__((section("sfrs")));
extern volatile unsigned int U3STASET __attribute__((section("sfrs")));
extern volatile unsigned int U2ASTAINV __attribute__((section("sfrs")));
extern volatile unsigned int U3STAINV __attribute__((section("sfrs")));
extern volatile unsigned int U2ATXREG __attribute__((section("sfrs")));
extern volatile unsigned int U3TXREG __attribute__((section("sfrs")));
extern volatile unsigned int U2ARXREG __attribute__((section("sfrs")));
extern volatile unsigned int U3RXREG __attribute__((section("sfrs")));
extern volatile unsigned int U2ABRG __attribute__((section("sfrs")));
extern volatile unsigned int U3BRG __attribute__((section("sfrs")));
extern volatile unsigned int U2ABRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U3BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U2ABRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U3BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U2ABRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U3BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U2BMODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned :4;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :10;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U2BMODEbits_t;
extern volatile __U2BMODEbits_t U2BMODEbits __asm__ ("U2BMODE") __attribute__((section("sfrs")));
extern volatile unsigned int U6MODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned :4;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :10;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U6MODEbits_t;
extern volatile __U6MODEbits_t U6MODEbits __asm__ ("U6MODE") __attribute__((section("sfrs")));
extern volatile unsigned int U2BMODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U6MODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U2BMODESET __attribute__((section("sfrs")));
extern volatile unsigned int U6MODESET __attribute__((section("sfrs")));
extern volatile unsigned int U2BMODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U6MODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U2BSTA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U2BSTAbits_t;
extern volatile __U2BSTAbits_t U2BSTAbits __asm__ ("U2BSTA") __attribute__((section("sfrs")));
extern volatile unsigned int U6STA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U6STAbits_t;
extern volatile __U6STAbits_t U6STAbits __asm__ ("U6STA") __attribute__((section("sfrs")));
extern volatile unsigned int U2BSTACLR __attribute__((section("sfrs")));
extern volatile unsigned int U6STACLR __attribute__((section("sfrs")));
extern volatile unsigned int U2BSTASET __attribute__((section("sfrs")));
extern volatile unsigned int U6STASET __attribute__((section("sfrs")));
extern volatile unsigned int U2BSTAINV __attribute__((section("sfrs")));
extern volatile unsigned int U6STAINV __attribute__((section("sfrs")));
extern volatile unsigned int U2BTXREG __attribute__((section("sfrs")));
extern volatile unsigned int U6TXREG __attribute__((section("sfrs")));
extern volatile unsigned int U2BRXREG __attribute__((section("sfrs")));
extern volatile unsigned int U6RXREG __attribute__((section("sfrs")));
extern volatile unsigned int U2BBRG __attribute__((section("sfrs")));
extern volatile unsigned int U6BRG __attribute__((section("sfrs")));
extern volatile unsigned int U2BBRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U6BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U2BBRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U6BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U2BBRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U6BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U2MODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN0:1;
    unsigned UEN1:1;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :5;
    unsigned UEN:2;
    unsigned :3;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U2MODEbits_t;
extern volatile __U2MODEbits_t U2MODEbits __asm__ ("U2MODE") __attribute__((section("sfrs")));
extern volatile unsigned int U3AMODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN0:1;
    unsigned UEN1:1;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :5;
    unsigned UEN:2;
    unsigned :3;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U3AMODEbits_t;
extern volatile __U3AMODEbits_t U3AMODEbits __asm__ ("U3AMODE") __attribute__((section("sfrs")));
extern volatile unsigned int U2MODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U3AMODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U2MODESET __attribute__((section("sfrs")));
extern volatile unsigned int U3AMODESET __attribute__((section("sfrs")));
extern volatile unsigned int U2MODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U3AMODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U2STA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U2STAbits_t;
extern volatile __U2STAbits_t U2STAbits __asm__ ("U2STA") __attribute__((section("sfrs")));
extern volatile unsigned int U3ASTA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U3ASTAbits_t;
extern volatile __U3ASTAbits_t U3ASTAbits __asm__ ("U3ASTA") __attribute__((section("sfrs")));
extern volatile unsigned int U2STACLR __attribute__((section("sfrs")));
extern volatile unsigned int U3ASTACLR __attribute__((section("sfrs")));
extern volatile unsigned int U2STASET __attribute__((section("sfrs")));
extern volatile unsigned int U3ASTASET __attribute__((section("sfrs")));
extern volatile unsigned int U2STAINV __attribute__((section("sfrs")));
extern volatile unsigned int U3ASTAINV __attribute__((section("sfrs")));
extern volatile unsigned int U2TXREG __attribute__((section("sfrs")));
extern volatile unsigned int U3ATXREG __attribute__((section("sfrs")));
extern volatile unsigned int U2RXREG __attribute__((section("sfrs")));
extern volatile unsigned int U3ARXREG __attribute__((section("sfrs")));
extern volatile unsigned int U2BRG __attribute__((section("sfrs")));
extern volatile unsigned int U3ABRG __attribute__((section("sfrs")));
extern volatile unsigned int U2BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U3ABRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U2BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U3ABRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U2BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U3ABRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U3BMODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned :4;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :10;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U3BMODEbits_t;
extern volatile __U3BMODEbits_t U3BMODEbits __asm__ ("U3BMODE") __attribute__((section("sfrs")));
extern volatile unsigned int U5MODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned :4;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :10;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U5MODEbits_t;
extern volatile __U5MODEbits_t U5MODEbits __asm__ ("U5MODE") __attribute__((section("sfrs")));
extern volatile unsigned int U3BMODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U5MODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U3BMODESET __attribute__((section("sfrs")));
extern volatile unsigned int U5MODESET __attribute__((section("sfrs")));
extern volatile unsigned int U3BMODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U5MODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U3BSTA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U3BSTAbits_t;
extern volatile __U3BSTAbits_t U3BSTAbits __asm__ ("U3BSTA") __attribute__((section("sfrs")));
extern volatile unsigned int U5STA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U5STAbits_t;
extern volatile __U5STAbits_t U5STAbits __asm__ ("U5STA") __attribute__((section("sfrs")));
extern volatile unsigned int U3BSTACLR __attribute__((section("sfrs")));
extern volatile unsigned int U5STACLR __attribute__((section("sfrs")));
extern volatile unsigned int U3BSTASET __attribute__((section("sfrs")));
extern volatile unsigned int U5STASET __attribute__((section("sfrs")));
extern volatile unsigned int U3BSTAINV __attribute__((section("sfrs")));
extern volatile unsigned int U5STAINV __attribute__((section("sfrs")));
extern volatile unsigned int U3BTXREG __attribute__((section("sfrs")));
extern volatile unsigned int U5TXREG __attribute__((section("sfrs")));
extern volatile unsigned int U3BRXREG __attribute__((section("sfrs")));
extern volatile unsigned int U5RXREG __attribute__((section("sfrs")));
extern volatile unsigned int U3BBRG __attribute__((section("sfrs")));
extern volatile unsigned int U5BRG __attribute__((section("sfrs")));
extern volatile unsigned int U3BBRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U5BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U3BBRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U5BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U3BBRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U5BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int PMCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RDSP:1;
    unsigned WRSP:1;
    unsigned :1;
    unsigned CS1P:1;
    unsigned CS2P:1;
    unsigned ALP:1;
    unsigned CSF0:1;
    unsigned CSF1:1;
    unsigned PTRDEN:1;
    unsigned PTWREN:1;
    unsigned PMPTTL:1;
    unsigned ADRMUX0:1;
    unsigned ADRMUX1:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :6;
    unsigned CSF:2;
    unsigned :3;
    unsigned ADRMUX:2;
    unsigned PSIDL:1;
    unsigned :1;
    unsigned PMPEN:1;
  };
  struct {
    unsigned w:32;
  };
} __PMCONbits_t;
extern volatile __PMCONbits_t PMCONbits __asm__ ("PMCON") __attribute__((section("sfrs")));
extern volatile unsigned int PMCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int PMCONSET __attribute__((section("sfrs")));
extern volatile unsigned int PMCONINV __attribute__((section("sfrs")));
extern volatile unsigned int PMMODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned WAITE0:1;
    unsigned WAITE1:1;
    unsigned WAITM0:1;
    unsigned WAITM1:1;
    unsigned WAITM2:1;
    unsigned WAITM3:1;
    unsigned WAITB0:1;
    unsigned WAITB1:1;
    unsigned MODE0:1;
    unsigned MODE1:1;
    unsigned MODE16:1;
    unsigned INCM0:1;
    unsigned INCM1:1;
    unsigned IRQM0:1;
    unsigned IRQM1:1;
    unsigned BUSY:1;
  };
  struct {
    unsigned WAITE:2;
    unsigned WAITM:4;
    unsigned WAITB:2;
    unsigned MODE:2;
    unsigned :1;
    unsigned INCM:2;
    unsigned IRQM:2;
  };
  struct {
    unsigned w:32;
  };
} __PMMODEbits_t;
extern volatile __PMMODEbits_t PMMODEbits __asm__ ("PMMODE") __attribute__((section("sfrs")));
extern volatile unsigned int PMMODECLR __attribute__((section("sfrs")));
extern volatile unsigned int PMMODESET __attribute__((section("sfrs")));
extern volatile unsigned int PMMODEINV __attribute__((section("sfrs")));
extern volatile unsigned int PMADDR __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PADDR:14;
    unsigned CS1:1;
    unsigned CS2:1;
  };
  struct {
    unsigned :14;
    unsigned CS:2;
  };
  struct {
    unsigned w:32;
  };
} __PMADDRbits_t;
extern volatile __PMADDRbits_t PMADDRbits __asm__ ("PMADDR") __attribute__((section("sfrs")));
extern volatile unsigned int PMADDRCLR __attribute__((section("sfrs")));
extern volatile unsigned int PMADDRSET __attribute__((section("sfrs")));
extern volatile unsigned int PMADDRINV __attribute__((section("sfrs")));
extern volatile unsigned int PMDOUT __attribute__((section("sfrs")));
extern volatile unsigned int PMDOUTCLR __attribute__((section("sfrs")));
extern volatile unsigned int PMDOUTSET __attribute__((section("sfrs")));
extern volatile unsigned int PMDOUTINV __attribute__((section("sfrs")));
extern volatile unsigned int PMDIN __attribute__((section("sfrs")));
extern volatile unsigned int PMDINCLR __attribute__((section("sfrs")));
extern volatile unsigned int PMDINSET __attribute__((section("sfrs")));
extern volatile unsigned int PMDININV __attribute__((section("sfrs")));
extern volatile unsigned int PMAEN __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PTEN0:1;
    unsigned PTEN1:1;
    unsigned PTEN2:1;
    unsigned PTEN3:1;
    unsigned PTEN4:1;
    unsigned PTEN5:1;
    unsigned PTEN6:1;
    unsigned PTEN7:1;
    unsigned PTEN8:1;
    unsigned PTEN9:1;
    unsigned PTEN10:1;
    unsigned PTEN11:1;
    unsigned PTEN12:1;
    unsigned PTEN13:1;
    unsigned PTEN14:1;
    unsigned PTEN15:1;
  };
  struct {
    unsigned w:32;
  };
} __PMAENbits_t;
extern volatile __PMAENbits_t PMAENbits __asm__ ("PMAEN") __attribute__((section("sfrs")));
extern volatile unsigned int PMAENCLR __attribute__((section("sfrs")));
extern volatile unsigned int PMAENSET __attribute__((section("sfrs")));
extern volatile unsigned int PMAENINV __attribute__((section("sfrs")));
extern volatile unsigned int PMSTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OB0E:1;
    unsigned OB1E:1;
    unsigned OB2E:1;
    unsigned OB3E:1;
    unsigned :2;
    unsigned OBUF:1;
    unsigned OBE:1;
    unsigned IB0F:1;
    unsigned IB1F:1;
    unsigned IB2F:1;
    unsigned IB3F:1;
    unsigned :2;
    unsigned IBOV:1;
    unsigned IBF:1;
  };
  struct {
    unsigned w:32;
  };
} __PMSTATbits_t;
extern volatile __PMSTATbits_t PMSTATbits __asm__ ("PMSTAT") __attribute__((section("sfrs")));
extern volatile unsigned int PMSTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int PMSTATSET __attribute__((section("sfrs")));
extern volatile unsigned int PMSTATINV __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned DONE:1;
    unsigned SAMP:1;
    unsigned ASAM:1;
    unsigned :1;
    unsigned CLRASAM:1;
    unsigned SSRC0:1;
    unsigned SSRC1:1;
    unsigned SSRC2:1;
    unsigned FORM0:1;
    unsigned FORM1:1;
    unsigned FORM2:1;
    unsigned :2;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :5;
    unsigned SSRC:3;
    unsigned FORM:3;
    unsigned :2;
    unsigned ADSIDL:1;
    unsigned :1;
    unsigned ADON:1;
  };
  struct {
    unsigned w:32;
  };
} __AD1CON1bits_t;
extern volatile __AD1CON1bits_t AD1CON1bits __asm__ ("AD1CON1") __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON1CLR __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON1SET __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON1INV __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ALTS:1;
    unsigned BUFM:1;
    unsigned SMPI0:1;
    unsigned SMPI1:1;
    unsigned SMPI2:1;
    unsigned SMPI3:1;
    unsigned :1;
    unsigned BUFS:1;
    unsigned :2;
    unsigned CSCNA:1;
    unsigned :1;
    unsigned OFFCAL:1;
    unsigned VCFG0:1;
    unsigned VCFG1:1;
    unsigned VCFG2:1;
  };
  struct {
    unsigned :2;
    unsigned SMPI:4;
    unsigned :7;
    unsigned VCFG:3;
  };
  struct {
    unsigned w:32;
  };
} __AD1CON2bits_t;
extern volatile __AD1CON2bits_t AD1CON2bits __asm__ ("AD1CON2") __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON2CLR __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON2SET __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON2INV __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ADCS0:1;
    unsigned ADCS1:1;
    unsigned ADCS2:1;
    unsigned ADCS3:1;
    unsigned ADCS4:1;
    unsigned ADCS5:1;
    unsigned ADCS6:1;
    unsigned ADCS7:1;
    unsigned SAMC0:1;
    unsigned SAMC1:1;
    unsigned SAMC2:1;
    unsigned SAMC3:1;
    unsigned SAMC4:1;
    unsigned :2;
    unsigned ADRC:1;
  };
  struct {
    unsigned ADCS:8;
    unsigned SAMC:5;
  };
  struct {
    unsigned w:32;
  };
} __AD1CON3bits_t;
extern volatile __AD1CON3bits_t AD1CON3bits __asm__ ("AD1CON3") __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON3CLR __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON3SET __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON3INV __attribute__((section("sfrs")));
extern volatile unsigned int AD1CHS __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :16;
    unsigned CH0SA0:1;
    unsigned CH0SA1:1;
    unsigned CH0SA2:1;
    unsigned CH0SA3:1;
    unsigned :3;
    unsigned CH0NA:1;
    unsigned CH0SB0:1;
    unsigned CH0SB1:1;
    unsigned CH0SB2:1;
    unsigned CH0SB3:1;
    unsigned :3;
    unsigned CH0NB:1;
  };
  struct {
    unsigned :16;
    unsigned CH0SA:4;
    unsigned :4;
    unsigned CH0SB:4;
  };
  struct {
    unsigned w:32;
  };
} __AD1CHSbits_t;
extern volatile __AD1CHSbits_t AD1CHSbits __asm__ ("AD1CHS") __attribute__((section("sfrs")));
extern volatile unsigned int AD1CHSCLR __attribute__((section("sfrs")));
extern volatile unsigned int AD1CHSSET __attribute__((section("sfrs")));
extern volatile unsigned int AD1CHSINV __attribute__((section("sfrs")));
extern volatile unsigned int AD1CSSL __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CSSL0:1;
    unsigned CSSL1:1;
    unsigned CSSL2:1;
    unsigned CSSL3:1;
    unsigned CSSL4:1;
    unsigned CSSL5:1;
    unsigned CSSL6:1;
    unsigned CSSL7:1;
    unsigned CSSL8:1;
    unsigned CSSL9:1;
    unsigned CSSL10:1;
    unsigned CSSL11:1;
    unsigned CSSL12:1;
    unsigned CSSL13:1;
    unsigned CSSL14:1;
    unsigned CSSL15:1;
  };
  struct {
    unsigned w:32;
  };
} __AD1CSSLbits_t;
extern volatile __AD1CSSLbits_t AD1CSSLbits __asm__ ("AD1CSSL") __attribute__((section("sfrs")));
extern volatile unsigned int AD1CSSLCLR __attribute__((section("sfrs")));
extern volatile unsigned int AD1CSSLSET __attribute__((section("sfrs")));
extern volatile unsigned int AD1CSSLINV __attribute__((section("sfrs")));
extern volatile unsigned int AD1PCFG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PCFG0:1;
    unsigned PCFG1:1;
    unsigned PCFG2:1;
    unsigned PCFG3:1;
    unsigned PCFG4:1;
    unsigned PCFG5:1;
    unsigned PCFG6:1;
    unsigned PCFG7:1;
    unsigned PCFG8:1;
    unsigned PCFG9:1;
    unsigned PCFG10:1;
    unsigned PCFG11:1;
    unsigned PCFG12:1;
    unsigned PCFG13:1;
    unsigned PCFG14:1;
    unsigned PCFG15:1;
  };
  struct {
    unsigned w:32;
  };
} __AD1PCFGbits_t;
extern volatile __AD1PCFGbits_t AD1PCFGbits __asm__ ("AD1PCFG") __attribute__((section("sfrs")));
extern volatile unsigned int AD1PCFGCLR __attribute__((section("sfrs")));
extern volatile unsigned int AD1PCFGSET __attribute__((section("sfrs")));
extern volatile unsigned int AD1PCFGINV __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF0 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF1 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF2 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF3 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF4 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF5 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF6 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF7 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF8 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF9 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUFA __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUFB __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUFC __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUFD __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUFE __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUFF __attribute__((section("sfrs")));
extern volatile unsigned int CVRCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CVR0:1;
    unsigned CVR1:1;
    unsigned CVR2:1;
    unsigned CVR3:1;
    unsigned CVRSS:1;
    unsigned CVRR:1;
    unsigned CVROE:1;
    unsigned :8;
    unsigned ON:1;
  };
  struct {
    unsigned CVR:4;
  };
  struct {
    unsigned w:32;
  };
} __CVRCONbits_t;
extern volatile __CVRCONbits_t CVRCONbits __asm__ ("CVRCON") __attribute__((section("sfrs")));
extern volatile unsigned int CVRCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int CVRCONSET __attribute__((section("sfrs")));
extern volatile unsigned int CVRCONINV __attribute__((section("sfrs")));
extern volatile unsigned int CM1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CCH0:1;
    unsigned CCH1:1;
    unsigned :2;
    unsigned CREF:1;
    unsigned :1;
    unsigned EVPOL0:1;
    unsigned EVPOL1:1;
    unsigned COUT:1;
    unsigned :4;
    unsigned CPOL:1;
    unsigned COE:1;
    unsigned ON:1;
  };
  struct {
    unsigned CCH:2;
    unsigned :4;
    unsigned EVPOL:2;
  };
  struct {
    unsigned w:32;
  };
} __CM1CONbits_t;
extern volatile __CM1CONbits_t CM1CONbits __asm__ ("CM1CON") __attribute__((section("sfrs")));
extern volatile unsigned int CM1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int CM1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int CM1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int CM2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CCH0:1;
    unsigned CCH1:1;
    unsigned :2;
    unsigned CREF:1;
    unsigned :1;
    unsigned EVPOL0:1;
    unsigned EVPOL1:1;
    unsigned COUT:1;
    unsigned :4;
    unsigned CPOL:1;
    unsigned COE:1;
    unsigned ON:1;
  };
  struct {
    unsigned CCH:2;
    unsigned :4;
    unsigned EVPOL:2;
  };
  struct {
    unsigned w:32;
  };
} __CM2CONbits_t;
extern volatile __CM2CONbits_t CM2CONbits __asm__ ("CM2CON") __attribute__((section("sfrs")));
extern volatile unsigned int CM2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int CM2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int CM2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int CMSTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned C1OUT:1;
    unsigned C2OUT:1;
    unsigned :11;
    unsigned SIDL:1;
    unsigned FRZ:1;
  };
  struct {
    unsigned w:32;
  };
} __CMSTATbits_t;
extern volatile __CMSTATbits_t CMSTATbits __asm__ ("CMSTAT") __attribute__((section("sfrs")));
extern volatile unsigned int CMSTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int CMSTATSET __attribute__((section("sfrs")));
extern volatile unsigned int CMSTATINV __attribute__((section("sfrs")));
extern volatile unsigned int OSCCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OSWEN:1;
    unsigned SOSCEN:1;
    unsigned UFRCEN:1;
    unsigned CF:1;
    unsigned SLPEN:1;
    unsigned SLOCK:1;
    unsigned ULOCK:1;
    unsigned CLKLOCK:1;
    unsigned NOSC0:1;
    unsigned NOSC1:1;
    unsigned NOSC2:1;
    unsigned :1;
    unsigned COSC0:1;
    unsigned COSC1:1;
    unsigned COSC2:1;
    unsigned :1;
    unsigned PLLMULT0:1;
    unsigned PLLMULT1:1;
    unsigned PLLMULT2:1;
    unsigned PBDIV0:1;
    unsigned PBDIV1:1;
    unsigned :1;
    unsigned SOSCRDY:1;
    unsigned :1;
    unsigned FRCDIV0:1;
    unsigned FRCDIV1:1;
    unsigned FRCDIV2:1;
    unsigned PLLODIV0:1;
    unsigned PLLODIV1:1;
    unsigned PLLODIV2:1;
  };
  struct {
    unsigned :8;
    unsigned NOSC:3;
    unsigned :1;
    unsigned COSC:3;
    unsigned :1;
    unsigned PLLMULT:3;
    unsigned PBDIV:2;
    unsigned :3;
    unsigned FRCDIV:3;
    unsigned PLLODIV:3;
  };
  struct {
    unsigned w:32;
  };
} __OSCCONbits_t;
extern volatile __OSCCONbits_t OSCCONbits __asm__ ("OSCCON") __attribute__((section("sfrs")));
extern volatile unsigned int OSCCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int OSCCONSET __attribute__((section("sfrs")));
extern volatile unsigned int OSCCONINV __attribute__((section("sfrs")));
extern volatile unsigned int OSCTUN __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TUN0:1;
    unsigned TUN1:1;
    unsigned TUN2:1;
    unsigned TUN3:1;
    unsigned TUN4:1;
    unsigned TUN5:1;
  };
  struct {
    unsigned TUN:6;
  };
  struct {
    unsigned w:32;
  };
} __OSCTUNbits_t;
extern volatile __OSCTUNbits_t OSCTUNbits __asm__ ("OSCTUN") __attribute__((section("sfrs")));
extern volatile unsigned int OSCTUNCLR __attribute__((section("sfrs")));
extern volatile unsigned int OSCTUNSET __attribute__((section("sfrs")));
extern volatile unsigned int OSCTUNINV __attribute__((section("sfrs")));
extern volatile unsigned int DDPCON __attribute__((section("sfrs")));
typedef struct {
  unsigned TDOEN:1;
  unsigned :1;
  unsigned TROEN:1;
  unsigned JTAGEN:1;
} __DDPCONbits_t;
extern volatile __DDPCONbits_t DDPCONbits __asm__ ("DDPCON") __attribute__((section("sfrs")));
extern unsigned int DEVID __attribute__((section("sfrs")));
typedef struct {
  unsigned DEVID:28;
  unsigned VER:4;
} __DEVIDbits_t;
extern __DEVIDbits_t DEVIDbits __asm__ ("DEVID") __attribute__((section("sfrs")));
extern volatile unsigned int SYSKEY __attribute__((section("sfrs")));
extern volatile unsigned int NVMCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned NVMOP:4;
    unsigned :7;
    unsigned LVDSTAT:1;
    unsigned LVDERR:1;
    unsigned WRERR:1;
    unsigned WREN:1;
    unsigned WR:1;
  };
  struct {
    unsigned NVMOP0:1;
    unsigned NVMOP1:1;
    unsigned NVMOP2:1;
    unsigned NVMOP3:1;
  };
  struct {
    unsigned PROGOP:4;
  };
  struct {
    unsigned PROGOP0:1;
    unsigned PROGOP1:1;
    unsigned PROGOP2:1;
    unsigned PROGOP3:1;
  };
  struct {
    unsigned w:32;
  };
} __NVMCONbits_t;
extern volatile __NVMCONbits_t NVMCONbits __asm__ ("NVMCON") __attribute__((section("sfrs")));
extern volatile unsigned int NVMCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int NVMCONSET __attribute__((section("sfrs")));
extern volatile unsigned int NVMCONINV __attribute__((section("sfrs")));
extern volatile unsigned int NVMKEY __attribute__((section("sfrs")));
extern volatile unsigned int NVMADDR __attribute__((section("sfrs")));
extern volatile unsigned int NVMADDRCLR __attribute__((section("sfrs")));
extern volatile unsigned int NVMADDRSET __attribute__((section("sfrs")));
extern volatile unsigned int NVMADDRINV __attribute__((section("sfrs")));
extern volatile unsigned int NVMDATA __attribute__((section("sfrs")));
extern volatile unsigned int NVMSRCADDR __attribute__((section("sfrs")));
extern volatile unsigned int RCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned POR:1;
    unsigned BOR:1;
    unsigned IDLE:1;
    unsigned SLEEP:1;
    unsigned WDTO:1;
    unsigned :1;
    unsigned SWR:1;
    unsigned EXTR:1;
    unsigned VREGS:1;
    unsigned CMR:1;
  };
  struct {
    unsigned w:32;
  };
} __RCONbits_t;
extern volatile __RCONbits_t RCONbits __asm__ ("RCON") __attribute__((section("sfrs")));
extern volatile unsigned int RCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int RCONSET __attribute__((section("sfrs")));
extern volatile unsigned int RCONINV __attribute__((section("sfrs")));
extern volatile unsigned int RSWRST __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SWRST:1;
  };
  struct {
    unsigned w:32;
  };
} __RSWRSTbits_t;
extern volatile __RSWRSTbits_t RSWRSTbits __asm__ ("RSWRST") __attribute__((section("sfrs")));
extern volatile unsigned int RSWRSTCLR __attribute__((section("sfrs")));
extern volatile unsigned int RSWRSTSET __attribute__((section("sfrs")));
extern volatile unsigned int RSWRSTINV __attribute__((section("sfrs")));
extern volatile unsigned int _DDPSTAT __attribute__((section("sfrs")));
typedef struct {
  unsigned :1;
  unsigned APIFUL:1;
  unsigned APOFUL:1;
  unsigned STRFUL:1;
  unsigned :5;
  unsigned APIOV:1;
  unsigned APOOV:1;
  unsigned :5;
  unsigned STOV:16;
} ___DDPSTATbits_t;
extern volatile ___DDPSTATbits_t _DDPSTATbits __asm__ ("_DDPSTAT") __attribute__((section("sfrs")));
extern volatile unsigned int _STRO __attribute__((section("sfrs")));
extern volatile unsigned int _STROCLR __attribute__((section("sfrs")));
extern volatile unsigned int _STROSET __attribute__((section("sfrs")));
extern volatile unsigned int _STROINV __attribute__((section("sfrs")));
extern volatile unsigned int _APPO __attribute__((section("sfrs")));
extern volatile unsigned int _APPOCLR __attribute__((section("sfrs")));
extern volatile unsigned int _APPOSET __attribute__((section("sfrs")));
extern volatile unsigned int _APPOINV __attribute__((section("sfrs")));
extern volatile unsigned int _APPI __attribute__((section("sfrs")));
extern volatile unsigned int INTCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned INT0EP:1;
    unsigned INT1EP:1;
    unsigned INT2EP:1;
    unsigned INT3EP:1;
    unsigned INT4EP:1;
    unsigned :3;
    unsigned TPC:3;
    unsigned :1;
    unsigned MVEC:1;
    unsigned :1;
    unsigned FRZ:1;
    unsigned :1;
    unsigned SS0:3;
  };
  struct {
    unsigned w:32;
  };
} __INTCONbits_t;
extern volatile __INTCONbits_t INTCONbits __asm__ ("INTCON") __attribute__((section("sfrs")));
extern volatile unsigned int INTCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int INTCONSET __attribute__((section("sfrs")));
extern volatile unsigned int INTCONINV __attribute__((section("sfrs")));
extern volatile unsigned int INTSTAT __attribute__((section("sfrs")));
typedef struct {
  unsigned VEC:8;
  unsigned SRIPL:3;
} __INTSTATbits_t;
extern volatile __INTSTATbits_t INTSTATbits __asm__ ("INTSTAT") __attribute__((section("sfrs")));
extern volatile unsigned int IPTMR __attribute__((section("sfrs")));
extern volatile unsigned int IPTMRCLR __attribute__((section("sfrs")));
extern volatile unsigned int IPTMRSET __attribute__((section("sfrs")));
extern volatile unsigned int IPTMRINV __attribute__((section("sfrs")));
extern volatile unsigned int IFS0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CTIF:1;
    unsigned CS0IF:1;
    unsigned CS1IF:1;
    unsigned INT0IF:1;
    unsigned T1IF:1;
    unsigned IC1IF:1;
    unsigned OC1IF:1;
    unsigned INT1IF:1;
    unsigned T2IF:1;
    unsigned IC2IF:1;
    unsigned OC2IF:1;
    unsigned INT2IF:1;
    unsigned T3IF:1;
    unsigned IC3IF:1;
    unsigned OC3IF:1;
    unsigned INT3IF:1;
    unsigned T4IF:1;
    unsigned IC4IF:1;
    unsigned OC4IF:1;
    unsigned INT4IF:1;
    unsigned T5IF:1;
    unsigned IC5IF:1;
    unsigned OC5IF:1;
    unsigned SPI1EIF:1;
    unsigned SPI1RXIF:1;
    unsigned SPI1TXIF:1;
    unsigned :3;
    unsigned I2C1BIF:1;
    unsigned I2C1SIF:1;
    unsigned I2C1MIF:1;
  };
  struct {
    unsigned :26;
    unsigned U1AEIF:1;
    unsigned U1ARXIF:1;
    unsigned U1ATXIF:1;
  };
  struct {
    unsigned :26;
    unsigned SPI1AEIF:1;
    unsigned SPI1ARXIF:1;
    unsigned SPI1ATXIF:1;
  };
  struct {
    unsigned :26;
    unsigned I2C1ABIF:1;
    unsigned I2C1ASIF:1;
    unsigned I2C1AMIF:1;
  };
  struct {
    unsigned :26;
    unsigned U1EIF:1;
    unsigned U1RXIF:1;
    unsigned U1TXIF:1;
  };
  struct {
    unsigned w:32;
  };
  struct {
    unsigned :26;
    unsigned SPI3EIF:1;
    unsigned SPI3RXIF:1;
    unsigned SPI3TXIF:1;
  };
  struct {
    unsigned :26;
    unsigned I2C3BIF:1;
    unsigned I2C3SIF:1;
    unsigned I2C3MIF:1;
  };
} __IFS0bits_t;
extern volatile __IFS0bits_t IFS0bits __asm__ ("IFS0") __attribute__((section("sfrs")));
extern volatile unsigned int IFS0CLR __attribute__((section("sfrs")));
extern volatile unsigned int IFS0SET __attribute__((section("sfrs")));
extern volatile unsigned int IFS0INV __attribute__((section("sfrs")));
extern volatile unsigned int IFS1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CNIF:1;
    unsigned AD1IF:1;
    unsigned PMPIF:1;
    unsigned CMP1IF:1;
    unsigned CMP2IF:1;
    unsigned :6;
    unsigned I2C2BIF:1;
    unsigned I2C2SIF:1;
    unsigned I2C2MIF:1;
    unsigned FSCMIF:1;
    unsigned RTCCIF:1;
    unsigned DMA0IF:1;
    unsigned DMA1IF:1;
    unsigned DMA2IF:1;
    unsigned DMA3IF:1;
    unsigned DMA4IF:1;
    unsigned DMA5IF:1;
    unsigned DMA6IF:1;
    unsigned DMA7IF:1;
    unsigned FCEIF:1;
    unsigned USBIF:1;
    unsigned CAN1IF:1;
    unsigned CAN2IF:1;
    unsigned ETHIF:1;
    unsigned IC1EIF:1;
    unsigned IC2EIF:1;
    unsigned IC3EIF:1;
  };
  struct {
    unsigned :5;
    unsigned U2AEIF:1;
    unsigned U2ARXIF:1;
    unsigned U2ATXIF:1;
    unsigned U3AEIF:1;
    unsigned U3ARXIF:1;
    unsigned U3ATXIF:1;
  };
  struct {
    unsigned :5;
    unsigned SPI2AEIF:1;
    unsigned SPI2ARXIF:1;
    unsigned SPI2ATXIF:1;
    unsigned SPI3AEIF:1;
    unsigned SPI3ARXIF:1;
    unsigned SPI3ATXIF:1;
  };
  struct {
    unsigned :5;
    unsigned U3EIF:1;
    unsigned U3RXIF:1;
    unsigned U3TXIF:1;
    unsigned U2EIF:1;
    unsigned U2RXIF:1;
    unsigned U2TXIF:1;
  };
  struct {
    unsigned :5;
    unsigned SPI2EIF:1;
    unsigned SPI2RXIF:1;
    unsigned SPI2TXIF:1;
    unsigned SPI4EIF:1;
    unsigned SPI4RXIF:1;
    unsigned SPI4TXIF:1;
  };
  struct {
    unsigned :5;
    unsigned I2C4BIF:1;
    unsigned I2C4SIF:1;
    unsigned I2C4MIF:1;
    unsigned I2C5BIF:1;
    unsigned I2C5SIF:1;
    unsigned I2C5MIF:1;
  };
  struct {
    unsigned w:32;
  };
} __IFS1bits_t;
extern volatile __IFS1bits_t IFS1bits __asm__ ("IFS1") __attribute__((section("sfrs")));
extern volatile unsigned int IFS1CLR __attribute__((section("sfrs")));
extern volatile unsigned int IFS1SET __attribute__((section("sfrs")));
extern volatile unsigned int IFS1INV __attribute__((section("sfrs")));
extern volatile unsigned int IFS2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned IC4EIF:1;
    unsigned IC5EIF:1;
    unsigned PMPEIF:1;
  };
  struct {
    unsigned :3;
    unsigned U1BEIF:1;
    unsigned U1BRXIF:1;
    unsigned U1BTXIF:1;
    unsigned U2BEIF:1;
    unsigned U2BRXIF:1;
    unsigned U2BTXIF:1;
    unsigned U3BEIF:1;
    unsigned U3BRXIF:1;
    unsigned U3BTXIF:1;
  };
  struct {
    unsigned :3;
    unsigned U4EIF:1;
    unsigned U4RXIF:1;
    unsigned U4TXIF:1;
    unsigned U6EIF:1;
    unsigned U6RXIF:1;
    unsigned U6TXIF:1;
    unsigned U5EIF:1;
    unsigned U5RXIF:1;
    unsigned U5TXIF:1;
  };
  struct {
    unsigned w:32;
  };
} __IFS2bits_t;
extern volatile __IFS2bits_t IFS2bits __asm__ ("IFS2") __attribute__((section("sfrs")));
extern volatile unsigned int IFS2CLR __attribute__((section("sfrs")));
extern volatile unsigned int IFS2SET __attribute__((section("sfrs")));
extern volatile unsigned int IFS2INV __attribute__((section("sfrs")));
extern volatile unsigned int IEC0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CTIE:1;
    unsigned CS0IE:1;
    unsigned CS1IE:1;
    unsigned INT0IE:1;
    unsigned T1IE:1;
    unsigned IC1IE:1;
    unsigned OC1IE:1;
    unsigned INT1IE:1;
    unsigned T2IE:1;
    unsigned IC2IE:1;
    unsigned OC2IE:1;
    unsigned INT2IE:1;
    unsigned T3IE:1;
    unsigned IC3IE:1;
    unsigned OC3IE:1;
    unsigned INT3IE:1;
    unsigned T4IE:1;
    unsigned IC4IE:1;
    unsigned OC4IE:1;
    unsigned INT4IE:1;
    unsigned T5IE:1;
    unsigned IC5IE:1;
    unsigned OC5IE:1;
    unsigned SPI1EIE:1;
    unsigned SPI1RXIE:1;
    unsigned SPI1TXIE:1;
    unsigned :3;
    unsigned I2C1BIE:1;
    unsigned I2C1SIE:1;
    unsigned I2C1MIE:1;
  };
  struct {
    unsigned :26;
    unsigned U1AEIE:1;
    unsigned U1ARXIE:1;
    unsigned U1ATXIE:1;
  };
  struct {
    unsigned :26;
    unsigned SPI1AEIE:1;
    unsigned SPI1ARXIE:1;
    unsigned SPI1ATXIE:1;
  };
  struct {
    unsigned :26;
    unsigned U1EIE:1;
    unsigned U1RXIE:1;
    unsigned U1TXIE:1;
  };
  struct {
    unsigned :26;
    unsigned SPI3EIE:1;
    unsigned SPI3RXIE:1;
    unsigned SPI3TXIE:1;
  };
  struct {
    unsigned w:32;
  };
  struct {
    unsigned :26;
    unsigned I2C3BIE:1;
    unsigned I2C3SIE:1;
    unsigned I2C3MIE:1;
  };
} __IEC0bits_t;
extern volatile __IEC0bits_t IEC0bits __asm__ ("IEC0") __attribute__((section("sfrs")));
extern volatile unsigned int IEC0CLR __attribute__((section("sfrs")));
extern volatile unsigned int IEC0SET __attribute__((section("sfrs")));
extern volatile unsigned int IEC0INV __attribute__((section("sfrs")));
extern volatile unsigned int IEC1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CNIE:1;
    unsigned AD1IE:1;
    unsigned PMPIE:1;
    unsigned CMP1IE:1;
    unsigned CMP2IE:1;
    unsigned :6;
    unsigned I2C2BIE:1;
    unsigned I2C2SIE:1;
    unsigned I2C2MIE:1;
    unsigned FSCMIE:1;
    unsigned RTCCIE:1;
    unsigned DMA0IE:1;
    unsigned DMA1IE:1;
    unsigned DMA2IE:1;
    unsigned DMA3IE:1;
    unsigned DMA4IE:1;
    unsigned DMA5IE:1;
    unsigned DMA6IE:1;
    unsigned DMA7IE:1;
    unsigned FCEIE:1;
    unsigned USBIE:1;
    unsigned CAN1IE:1;
    unsigned CAN2IE:1;
    unsigned ETHIE:1;
    unsigned IC1EIE:1;
    unsigned IC2EIE:1;
    unsigned IC3EIE:1;
  };
  struct {
    unsigned :5;
    unsigned U2AEIE:1;
    unsigned U2ARXIE:1;
    unsigned U2ATXIE:1;
    unsigned U3AEIE:1;
    unsigned U3ARXIE:1;
    unsigned U3ATXIE:1;
  };
  struct {
    unsigned :5;
    unsigned SPI2AEIE:1;
    unsigned SPI2ARXIE:1;
    unsigned SPI2ATXIE:1;
    unsigned SPI3AEIE:1;
    unsigned SPI3ARXIE:1;
    unsigned SPI3ATXIE:1;
  };
  struct {
    unsigned :5;
    unsigned U3EIE:1;
    unsigned U3RXIE:1;
    unsigned U3TXIE:1;
    unsigned U2EIE:1;
    unsigned U2RXIE:1;
    unsigned U2TXIE:1;
  };
  struct {
    unsigned :5;
    unsigned SPI2EIE:1;
    unsigned SPI2RXIE:1;
    unsigned SPI2TXIE:1;
    unsigned SPI4EIE:1;
    unsigned SPI4RXIE:1;
    unsigned SPI4TXIE:1;
  };
  struct {
    unsigned :5;
    unsigned I2C4BIE:1;
    unsigned I2C4SIE:1;
    unsigned I2C4MIE:1;
    unsigned I2C5BIE:1;
    unsigned I2C5SIE:1;
    unsigned I2C5MIE:1;
  };
  struct {
    unsigned w:32;
  };
} __IEC1bits_t;
extern volatile __IEC1bits_t IEC1bits __asm__ ("IEC1") __attribute__((section("sfrs")));
extern volatile unsigned int IEC1CLR __attribute__((section("sfrs")));
extern volatile unsigned int IEC1SET __attribute__((section("sfrs")));
extern volatile unsigned int IEC1INV __attribute__((section("sfrs")));
extern volatile unsigned int IEC2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned IC4EIE:1;
    unsigned IC5EIE:1;
    unsigned PMPEIE:1;
  };
  struct {
    unsigned :3;
    unsigned U1BEIE:1;
    unsigned U1BRXIE:1;
    unsigned U1BTXIE:1;
    unsigned U2BEIE:1;
    unsigned U2BRXIE:1;
    unsigned U2BTXIE:1;
    unsigned U3BEIE:1;
    unsigned U3BRXIE:1;
    unsigned U3BTXIE:1;
  };
  struct {
    unsigned :3;
    unsigned U4EIE:1;
    unsigned U4RXIE:1;
    unsigned U4TXIE:1;
    unsigned U6EIE:1;
    unsigned U6RXIE:1;
    unsigned U6TXIE:1;
    unsigned U5EIE:1;
    unsigned U5RXIE:1;
    unsigned U5TXIE:1;
  };
  struct {
    unsigned w:32;
  };
} __IEC2bits_t;
extern volatile __IEC2bits_t IEC2bits __asm__ ("IEC2") __attribute__((section("sfrs")));
extern volatile unsigned int IEC2CLR __attribute__((section("sfrs")));
extern volatile unsigned int IEC2SET __attribute__((section("sfrs")));
extern volatile unsigned int IEC2INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CTIS:2;
    unsigned CTIP:3;
    unsigned :3;
    unsigned CS0IS:2;
    unsigned CS0IP:3;
    unsigned :3;
    unsigned CS1IS:2;
    unsigned CS1IP:3;
    unsigned :3;
    unsigned INT0IS:2;
    unsigned INT0IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC0bits_t;
extern volatile __IPC0bits_t IPC0bits __asm__ ("IPC0") __attribute__((section("sfrs")));
extern volatile unsigned int IPC0CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC0SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC0INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned T1IS:2;
    unsigned T1IP:3;
    unsigned :3;
    unsigned IC1IS:2;
    unsigned IC1IP:3;
    unsigned :3;
    unsigned OC1IS:2;
    unsigned OC1IP:3;
    unsigned :3;
    unsigned INT1IS:2;
    unsigned INT1IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC1bits_t;
extern volatile __IPC1bits_t IPC1bits __asm__ ("IPC1") __attribute__((section("sfrs")));
extern volatile unsigned int IPC1CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC1SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC1INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned T2IS:2;
    unsigned T2IP:3;
    unsigned :3;
    unsigned IC2IS:2;
    unsigned IC2IP:3;
    unsigned :3;
    unsigned OC2IS:2;
    unsigned OC2IP:3;
    unsigned :3;
    unsigned INT2IS:2;
    unsigned INT2IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC2bits_t;
extern volatile __IPC2bits_t IPC2bits __asm__ ("IPC2") __attribute__((section("sfrs")));
extern volatile unsigned int IPC2CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC2SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC2INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned T3IS:2;
    unsigned T3IP:3;
    unsigned :3;
    unsigned IC3IS:2;
    unsigned IC3IP:3;
    unsigned :3;
    unsigned OC3IS:2;
    unsigned OC3IP:3;
    unsigned :3;
    unsigned INT3IS:2;
    unsigned INT3IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC3bits_t;
extern volatile __IPC3bits_t IPC3bits __asm__ ("IPC3") __attribute__((section("sfrs")));
extern volatile unsigned int IPC3CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC3SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC3INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC4 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned T4IS:2;
    unsigned T4IP:3;
    unsigned :3;
    unsigned IC4IS:2;
    unsigned IC4IP:3;
    unsigned :3;
    unsigned OC4IS:2;
    unsigned OC4IP:3;
    unsigned :3;
    unsigned INT4IS:2;
    unsigned INT4IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC4bits_t;
extern volatile __IPC4bits_t IPC4bits __asm__ ("IPC4") __attribute__((section("sfrs")));
extern volatile unsigned int IPC4CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC4SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC4INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC5 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned T5IS:2;
    unsigned T5IP:3;
    unsigned :3;
    unsigned IC5IS:2;
    unsigned IC5IP:3;
    unsigned :3;
    unsigned OC5IS:2;
    unsigned OC5IP:3;
    unsigned :3;
    unsigned SPI1IS:2;
    unsigned SPI1IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC5bits_t;
extern volatile __IPC5bits_t IPC5bits __asm__ ("IPC5") __attribute__((section("sfrs")));
extern volatile unsigned int IPC5CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC5SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC5INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC6 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :8;
    unsigned I2C1IS:2;
    unsigned I2C1IP:3;
    unsigned :3;
    unsigned CNIS:2;
    unsigned CNIP:3;
    unsigned :3;
    unsigned AD1IS:2;
    unsigned AD1IP:3;
  };
  struct {
    unsigned U1AIS:2;
    unsigned U1AIP:3;
  };
  struct {
    unsigned SPI1AIS:2;
    unsigned SPI1AIP:3;
  };
  struct {
    unsigned I2C1AIS:2;
    unsigned I2C1AIP:3;
  };
  struct {
    unsigned U1IS:2;
    unsigned U1IP:3;
  };
  struct {
    unsigned w:32;
  };
  struct {
    unsigned SPI3IS:2;
    unsigned SPI3IP:3;
  };
  struct {
    unsigned I2C3IS:2;
    unsigned I2C3IP:3;
  };
} __IPC6bits_t;
extern volatile __IPC6bits_t IPC6bits __asm__ ("IPC6") __attribute__((section("sfrs")));
extern volatile unsigned int IPC6CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC6SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC6INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC7 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PMPIS:2;
    unsigned PMPIP:3;
    unsigned :3;
    unsigned CMP1IS:2;
    unsigned CMP1IP:3;
    unsigned :3;
    unsigned CMP2IS:2;
    unsigned CMP2IP:3;
  };
  struct {
    unsigned :24;
    unsigned U2AIS:2;
    unsigned U2AIP:3;
  };
  struct {
    unsigned :24;
    unsigned SPI2AIS:2;
    unsigned SPI2AIP:3;
  };
  struct {
    unsigned :24;
    unsigned I2C2AIS:2;
    unsigned I2C2AIP:3;
  };
  struct {
    unsigned :24;
    unsigned SPI2IS:2;
    unsigned SPI2IP:3;
  };
  struct {
    unsigned w:32;
  };
  struct {
    unsigned :24;
    unsigned I2C4IS:2;
    unsigned I2C4IP:3;
  };
  struct {
    unsigned :24;
    unsigned U3IS:2;
    unsigned U3IP:3;
  };
} __IPC7bits_t;
extern volatile __IPC7bits_t IPC7bits __asm__ ("IPC7") __attribute__((section("sfrs")));
extern volatile unsigned int IPC7CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC7SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC7INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC8 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :8;
    unsigned I2C2IS:2;
    unsigned I2C2IP:3;
    unsigned :3;
    unsigned FSCMIS:2;
    unsigned FSCMIP:3;
    unsigned :3;
    unsigned RTCCIS:2;
    unsigned RTCCIP:3;
  };
  struct {
    unsigned U3AIS:2;
    unsigned U3AIP:3;
  };
  struct {
    unsigned U2IS:2;
    unsigned U2IP:3;
  };
  struct {
    unsigned SPI3AIS:2;
    unsigned SPI3AIP:3;
  };
  struct {
    unsigned I2C3AIS:2;
    unsigned I2C3AIP:3;
  };
  struct {
    unsigned w:32;
  };
  struct {
    unsigned SPI4IS:2;
    unsigned SPI4IP:3;
  };
  struct {
    unsigned I2C5IS:2;
    unsigned I2C5IP:3;
  };
} __IPC8bits_t;
extern volatile __IPC8bits_t IPC8bits __asm__ ("IPC8") __attribute__((section("sfrs")));
extern volatile unsigned int IPC8CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC8SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC8INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC9 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned DMA0IS:2;
    unsigned DMA0IP:3;
    unsigned :3;
    unsigned DMA1IS:2;
    unsigned DMA1IP:3;
    unsigned :3;
    unsigned DMA2IS:2;
    unsigned DMA2IP:3;
    unsigned :3;
    unsigned DMA3IS:2;
    unsigned DMA3IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC9bits_t;
extern volatile __IPC9bits_t IPC9bits __asm__ ("IPC9") __attribute__((section("sfrs")));
extern volatile unsigned int IPC9CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC9SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC9INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC10 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned DMA4IS:2;
    unsigned DMA4IP:3;
    unsigned :3;
    unsigned DMA5IS:2;
    unsigned DMA5IP:3;
    unsigned :3;
    unsigned DMA6IS:2;
    unsigned DMA6IP:3;
    unsigned :3;
    unsigned DMA7IS:2;
    unsigned DMA7IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC10bits_t;
extern volatile __IPC10bits_t IPC10bits __asm__ ("IPC10") __attribute__((section("sfrs")));
extern volatile unsigned int IPC10CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC10SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC10INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC11 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FCEIS:2;
    unsigned FCEIP:3;
    unsigned :3;
    unsigned USBIS:2;
    unsigned USBIP:3;
    unsigned :3;
    unsigned CAN1IS:2;
    unsigned CAN1IP:3;
    unsigned :3;
    unsigned CAN2IS:2;
    unsigned CAN2IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC11bits_t;
extern volatile __IPC11bits_t IPC11bits __asm__ ("IPC11") __attribute__((section("sfrs")));
extern volatile unsigned int IPC11CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC11SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC11INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC12 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ETHIS:2;
    unsigned ETHIP:3;
  };
  struct {
    unsigned :8;
    unsigned U1BIS:2;
    unsigned U1BIP:3;
    unsigned :3;
    unsigned U2BIS:2;
    unsigned U2BIP:3;
    unsigned :3;
    unsigned U3BIS:2;
    unsigned U3BIP:3;
  };
  struct {
    unsigned w:32;
  };
  struct {
    unsigned :8;
    unsigned U4IS:2;
    unsigned U4IP:3;
    unsigned :3;
    unsigned U6IS:2;
    unsigned U6IP:3;
    unsigned :3;
    unsigned U5IS:2;
    unsigned U5IP:3;
  };
} __IPC12bits_t;
extern volatile __IPC12bits_t IPC12bits __asm__ ("IPC12") __attribute__((section("sfrs")));
extern volatile unsigned int IPC12CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC12SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC12INV __attribute__((section("sfrs")));
extern volatile unsigned int BMXCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned BMXARB:3;
    unsigned :3;
    unsigned BMXWSDRM:1;
    unsigned :9;
    unsigned BMXERRIS:1;
    unsigned BMXERRDS:1;
    unsigned BMXERRDMA:1;
    unsigned BMXERRICD:1;
    unsigned BMXERRIXI:1;
    unsigned :5;
    unsigned BMXCHEDMA:1;
  };
  struct {
    unsigned w:32;
  };
} __BMXCONbits_t;
extern volatile __BMXCONbits_t BMXCONbits __asm__ ("BMXCON") __attribute__((section("sfrs")));
extern volatile unsigned int BMXCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int BMXCONSET __attribute__((section("sfrs")));
extern volatile unsigned int BMXCONINV __attribute__((section("sfrs")));
extern volatile unsigned int BMXDKPBA __attribute__((section("sfrs")));
extern volatile unsigned int BMXDKPBACLR __attribute__((section("sfrs")));
extern volatile unsigned int BMXDKPBASET __attribute__((section("sfrs")));
extern volatile unsigned int BMXDKPBAINV __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUDBA __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUDBACLR __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUDBASET __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUDBAINV __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUPBA __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUPBACLR __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUPBASET __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUPBAINV __attribute__((section("sfrs")));
extern volatile unsigned int BMXDRMSZ __attribute__((section("sfrs")));
extern volatile unsigned int BMXPUPBA __attribute__((section("sfrs")));
extern volatile unsigned int BMXPUPBACLR __attribute__((section("sfrs")));
extern volatile unsigned int BMXPUPBASET __attribute__((section("sfrs")));
extern volatile unsigned int BMXPUPBAINV __attribute__((section("sfrs")));
extern volatile unsigned int BMXPFMSZ __attribute__((section("sfrs")));
extern volatile unsigned int BMXBOOTSZ __attribute__((section("sfrs")));
extern volatile unsigned int DMACON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :11;
    unsigned DMABUSY:1;
    unsigned SUSPEND:1;
    unsigned :1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned w:32;
  };
} __DMACONbits_t;
extern volatile __DMACONbits_t DMACONbits __asm__ ("DMACON") __attribute__((section("sfrs")));
extern volatile unsigned int DMACONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DMACONSET __attribute__((section("sfrs")));
extern volatile unsigned int DMACONINV __attribute__((section("sfrs")));
extern volatile unsigned int DMASTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned DMACH:2;
    unsigned :1;
    unsigned RDWR:1;
  };
  struct {
    unsigned w:32;
  };
} __DMASTATbits_t;
extern volatile __DMASTATbits_t DMASTATbits __asm__ ("DMASTAT") __attribute__((section("sfrs")));
extern volatile unsigned int DMASTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DMASTATSET __attribute__((section("sfrs")));
extern volatile unsigned int DMASTATINV __attribute__((section("sfrs")));
extern volatile unsigned int DMAADDR __attribute__((section("sfrs")));
extern volatile unsigned int DMAADDRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DMAADDRSET __attribute__((section("sfrs")));
extern volatile unsigned int DMAADDRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCRCCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CRCCH:3;
    unsigned :2;
    unsigned CRCTYP:1;
    unsigned CRCAPP:1;
    unsigned CRCEN:1;
    unsigned PLEN:5;
    unsigned :11;
    unsigned BITO:1;
    unsigned :2;
    unsigned WBO:1;
    unsigned BYTO:2;
  };
  struct {
    unsigned w:32;
  };
} __DCRCCONbits_t;
extern volatile __DCRCCONbits_t DCRCCONbits __asm__ ("DCRCCON") __attribute__((section("sfrs")));
extern volatile unsigned int DCRCCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCRCCONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCRCCONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCRCDATA __attribute__((section("sfrs")));
extern volatile unsigned int DCRCDATACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCRCDATASET __attribute__((section("sfrs")));
extern volatile unsigned int DCRCDATAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCRCXOR __attribute__((section("sfrs")));
extern volatile unsigned int DCRCXORCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCRCXORSET __attribute__((section("sfrs")));
extern volatile unsigned int DCRCXORINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned :6;
    unsigned CHBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH0CONbits_t;
extern volatile __DCH0CONbits_t DCH0CONbits __asm__ ("DCH0CON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0ECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH0ECONbits_t;
extern volatile __DCH0ECONbits_t DCH0ECONbits __asm__ ("DCH0ECON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH0ECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0ECONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0ECONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH0INTbits_t;
extern volatile __DCH0INTbits_t DCH0INTbits __asm__ ("DCH0INT") __attribute__((section("sfrs")));
extern volatile unsigned int DCH0INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0INTSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0INTINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DAT __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DATSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DATINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned :6;
    unsigned CHBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH1CONbits_t;
extern volatile __DCH1CONbits_t DCH1CONbits __asm__ ("DCH1CON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1ECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH1ECONbits_t;
extern volatile __DCH1ECONbits_t DCH1ECONbits __asm__ ("DCH1ECON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH1ECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1ECONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1ECONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH1INTbits_t;
extern volatile __DCH1INTbits_t DCH1INTbits __asm__ ("DCH1INT") __attribute__((section("sfrs")));
extern volatile unsigned int DCH1INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1INTSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1INTINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DAT __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DATSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DATINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned :6;
    unsigned CHBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH2CONbits_t;
extern volatile __DCH2CONbits_t DCH2CONbits __asm__ ("DCH2CON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2ECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH2ECONbits_t;
extern volatile __DCH2ECONbits_t DCH2ECONbits __asm__ ("DCH2ECON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH2ECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2ECONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2ECONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH2INTbits_t;
extern volatile __DCH2INTbits_t DCH2INTbits __asm__ ("DCH2INT") __attribute__((section("sfrs")));
extern volatile unsigned int DCH2INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2INTSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2INTINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DAT __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DATSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DATINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned :6;
    unsigned CHBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH3CONbits_t;
extern volatile __DCH3CONbits_t DCH3CONbits __asm__ ("DCH3CON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3ECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH3ECONbits_t;
extern volatile __DCH3ECONbits_t DCH3ECONbits __asm__ ("DCH3ECON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH3ECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3ECONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3ECONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH3INTbits_t;
extern volatile __DCH3INTbits_t DCH3INTbits __asm__ ("DCH3INT") __attribute__((section("sfrs")));
extern volatile unsigned int DCH3INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3INTSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3INTINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DAT __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DATSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DATINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH4CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned :6;
    unsigned CHBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH4CONbits_t;
extern volatile __DCH4CONbits_t DCH4CONbits __asm__ ("DCH4CON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH4CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4CONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH4CONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH4ECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH4ECONbits_t;
extern volatile __DCH4ECONbits_t DCH4ECONbits __asm__ ("DCH4ECON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH4ECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4ECONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH4ECONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH4INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH4INTbits_t;
extern volatile __DCH4INTbits_t DCH4INTbits __asm__ ("DCH4INT") __attribute__((section("sfrs")));
extern volatile unsigned int DCH4INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4INTSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH4INTINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH4SSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH4SSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4SSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH4SSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH4SSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH4SSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4SSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH4SSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH4SPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4SPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4SPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH4SPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH4CSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH4CSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4CSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH4CSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH4CPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4CPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4CPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH4CPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DAT __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DATSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH4DATINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH5CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned :6;
    unsigned CHBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH5CONbits_t;
extern volatile __DCH5CONbits_t DCH5CONbits __asm__ ("DCH5CON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH5CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5CONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH5CONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH5ECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH5ECONbits_t;
extern volatile __DCH5ECONbits_t DCH5ECONbits __asm__ ("DCH5ECON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH5ECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5ECONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH5ECONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH5INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH5INTbits_t;
extern volatile __DCH5INTbits_t DCH5INTbits __asm__ ("DCH5INT") __attribute__((section("sfrs")));
extern volatile unsigned int DCH5INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5INTSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH5INTINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH5SSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH5SSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5SSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH5SSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH5SSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH5SSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5SSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH5SSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH5SPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5SPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5SPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH5SPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH5CSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH5CSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5CSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH5CSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH5CPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5CPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5CPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH5CPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DAT __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DATSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH5DATINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH6CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned :6;
    unsigned CHBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH6CONbits_t;
extern volatile __DCH6CONbits_t DCH6CONbits __asm__ ("DCH6CON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH6CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6CONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH6CONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH6ECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH6ECONbits_t;
extern volatile __DCH6ECONbits_t DCH6ECONbits __asm__ ("DCH6ECON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH6ECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6ECONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH6ECONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH6INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH6INTbits_t;
extern volatile __DCH6INTbits_t DCH6INTbits __asm__ ("DCH6INT") __attribute__((section("sfrs")));
extern volatile unsigned int DCH6INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6INTSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH6INTINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH6SSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH6SSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6SSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH6SSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH6SSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH6SSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6SSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH6SSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH6SPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6SPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6SPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH6SPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH6CSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH6CSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6CSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH6CSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH6CPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6CPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6CPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH6CPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DAT __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DATSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH6DATINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH7CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned :6;
    unsigned CHBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH7CONbits_t;
extern volatile __DCH7CONbits_t DCH7CONbits __asm__ ("DCH7CON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH7CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7CONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH7CONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH7ECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH7ECONbits_t;
extern volatile __DCH7ECONbits_t DCH7ECONbits __asm__ ("DCH7ECON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH7ECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7ECONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH7ECONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH7INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH7INTbits_t;
extern volatile __DCH7INTbits_t DCH7INTbits __asm__ ("DCH7INT") __attribute__((section("sfrs")));
extern volatile unsigned int DCH7INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7INTSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH7INTINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH7SSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH7SSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7SSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH7SSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH7SSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH7SSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7SSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH7SSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH7SPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7SPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7SPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH7SPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH7CSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH7CSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7CSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH7CSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH7CPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7CPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7CPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH7CPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DAT __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DATSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH7DATINV __attribute__((section("sfrs")));
extern volatile unsigned int CHECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PFMWS:3;
    unsigned :1;
    unsigned PREFEN:2;
    unsigned :2;
    unsigned DCSZ:2;
    unsigned :6;
    unsigned CHECOH:1;
  };
  struct {
    unsigned w:32;
  };
} __CHECONbits_t;
extern volatile __CHECONbits_t CHECONbits __asm__ ("CHECON") __attribute__((section("sfrs")));
extern volatile unsigned int CHECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int CHECONSET __attribute__((section("sfrs")));
extern volatile unsigned int CHECONINV __attribute__((section("sfrs")));
extern volatile unsigned int CHEACC __attribute__((section("sfrs")));
extern volatile unsigned int CHEACCCLR __attribute__((section("sfrs")));
extern volatile unsigned int CHEACCSET __attribute__((section("sfrs")));
extern volatile unsigned int CHEACCINV __attribute__((section("sfrs")));
extern volatile unsigned int CHETAG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned LTYPE:1;
    unsigned LLOCK:1;
    unsigned LVALID:1;
    unsigned LTAG:20;
  };
  struct {
    unsigned w:32;
  };
} __CHETAGbits_t;
extern volatile __CHETAGbits_t CHETAGbits __asm__ ("CHETAG") __attribute__((section("sfrs")));
extern volatile unsigned int CHETAGCLR __attribute__((section("sfrs")));
extern volatile unsigned int CHETAGSET __attribute__((section("sfrs")));
extern volatile unsigned int CHETAGINV __attribute__((section("sfrs")));
extern volatile unsigned int CHEMSK __attribute__((section("sfrs")));
extern volatile unsigned int CHEMSKCLR __attribute__((section("sfrs")));
extern volatile unsigned int CHEMSKSET __attribute__((section("sfrs")));
extern volatile unsigned int CHEMSKINV __attribute__((section("sfrs")));
extern volatile unsigned int CHEW0 __attribute__((section("sfrs")));
extern volatile unsigned int CHEW1 __attribute__((section("sfrs")));
extern volatile unsigned int CHEW2 __attribute__((section("sfrs")));
extern volatile unsigned int CHEW3 __attribute__((section("sfrs")));
extern volatile unsigned int CHELRU __attribute__((section("sfrs")));
extern volatile unsigned int CHEHIT __attribute__((section("sfrs")));
extern volatile unsigned int CHEMIS __attribute__((section("sfrs")));
extern volatile unsigned int CHEPFABT __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGIR __attribute__((section("sfrs")));
typedef struct {
  unsigned VBUSVDIF:1;
  unsigned :1;
  unsigned SESENDIF:1;
  unsigned SESVDIF:1;
  unsigned ACTVIF:1;
  unsigned LSTATEIF:1;
  unsigned T1MSECIF:1;
  unsigned IDIF:1;
} __U1OTGIRbits_t;
extern volatile __U1OTGIRbits_t U1OTGIRbits __asm__ ("U1OTGIR") __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGIRCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGIRSET __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGIRINV __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGIE __attribute__((section("sfrs")));
typedef struct {
  unsigned VBUSVDIE:1;
  unsigned :1;
  unsigned SESENDIE:1;
  unsigned SESVDIE:1;
  unsigned ACTVIE:1;
  unsigned LSTATEIE:1;
  unsigned T1MSECIE:1;
  unsigned IDIE:1;
} __U1OTGIEbits_t;
extern volatile __U1OTGIEbits_t U1OTGIEbits __asm__ ("U1OTGIE") __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGIECLR __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGIESET __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGIEINV __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGSTAT __attribute__((section("sfrs")));
typedef struct {
  unsigned VBUSVD:1;
  unsigned :1;
  unsigned SESEND:1;
  unsigned SESVD:1;
  unsigned :1;
  unsigned LSTATE:1;
  unsigned :1;
  unsigned ID:1;
} __U1OTGSTATbits_t;
extern volatile __U1OTGSTATbits_t U1OTGSTATbits __asm__ ("U1OTGSTAT") __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGCON __attribute__((section("sfrs")));
typedef struct {
  unsigned VBUSDIS:1;
  unsigned VBUSCHG:1;
  unsigned OTGEN:1;
  unsigned VBUSON:1;
  unsigned DMPULDWN:1;
  unsigned DPPULDWN:1;
  unsigned DMPULUP:1;
  unsigned DPPULUP:1;
} __U1OTGCONbits_t;
extern volatile __U1OTGCONbits_t U1OTGCONbits __asm__ ("U1OTGCON") __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGCONSET __attribute__((section("sfrs")));
extern volatile unsigned int U1OTGCONINV __attribute__((section("sfrs")));
extern volatile unsigned int U1PWRC __attribute__((section("sfrs")));
typedef struct {
  unsigned USBPWR:1;
  unsigned USUSPEND:1;
  unsigned :1;
  unsigned USBBUSY:1;
  unsigned USLPGRD:1;
  unsigned :2;
  unsigned UACTPND:1;
} __U1PWRCbits_t;
extern volatile __U1PWRCbits_t U1PWRCbits __asm__ ("U1PWRC") __attribute__((section("sfrs")));
extern volatile unsigned int U1PWRCCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1PWRCSET __attribute__((section("sfrs")));
extern volatile unsigned int U1PWRCINV __attribute__((section("sfrs")));
extern volatile unsigned int U1IR __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned DETACHIF:1;
  };
  struct {
    unsigned URSTIF:1;
    unsigned UERRIF:1;
    unsigned SOFIF:1;
    unsigned TRNIF:1;
    unsigned IDLEIF:1;
    unsigned RESUMEIF:1;
    unsigned ATTACHIF:1;
    unsigned STALLIF:1;
  };
} __U1IRbits_t;
extern volatile __U1IRbits_t U1IRbits __asm__ ("U1IR") __attribute__((section("sfrs")));
extern volatile unsigned int U1IRCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1IRSET __attribute__((section("sfrs")));
extern volatile unsigned int U1IRINV __attribute__((section("sfrs")));
extern volatile unsigned int U1IE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned DETACHIE:1;
  };
  struct {
    unsigned URSTIE:1;
    unsigned UERRIE:1;
    unsigned SOFIE:1;
    unsigned TRNIE:1;
    unsigned IDLEIE:1;
    unsigned RESUMEIE:1;
    unsigned ATTACHIE:1;
    unsigned STALLIE:1;
  };
} __U1IEbits_t;
extern volatile __U1IEbits_t U1IEbits __asm__ ("U1IE") __attribute__((section("sfrs")));
extern volatile unsigned int U1IECLR __attribute__((section("sfrs")));
extern volatile unsigned int U1IESET __attribute__((section("sfrs")));
extern volatile unsigned int U1IEINV __attribute__((section("sfrs")));
extern volatile unsigned int U1EIR __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PIDEF:1;
    unsigned CRC5EF:1;
  };
  struct {
    unsigned :1;
    unsigned EOFEF:1;
    unsigned CRC16EF:1;
    unsigned DFN8EF:1;
    unsigned BTOEF:1;
    unsigned DMAEF:1;
    unsigned BMXEF:1;
    unsigned BTSEF:1;
  };
} __U1EIRbits_t;
extern volatile __U1EIRbits_t U1EIRbits __asm__ ("U1EIR") __attribute__((section("sfrs")));
extern volatile unsigned int U1EIRCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EIRSET __attribute__((section("sfrs")));
extern volatile unsigned int U1EIRINV __attribute__((section("sfrs")));
extern volatile unsigned int U1EIE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PIDEE:1;
    unsigned CRC5EE:1;
  };
  struct {
    unsigned :1;
    unsigned EOFEE:1;
    unsigned CRC16EE:1;
    unsigned DFN8EE:1;
    unsigned BTOEE:1;
    unsigned DMAEE:1;
    unsigned BMXEE:1;
    unsigned BTSEE:1;
  };
} __U1EIEbits_t;
extern volatile __U1EIEbits_t U1EIEbits __asm__ ("U1EIE") __attribute__((section("sfrs")));
extern volatile unsigned int U1EIECLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EIESET __attribute__((section("sfrs")));
extern volatile unsigned int U1EIEINV __attribute__((section("sfrs")));
extern volatile unsigned int U1STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :2;
    unsigned PPBI:1;
    unsigned DIR:1;
    unsigned ENDPT0:1;
  };
  struct {
    unsigned :4;
    unsigned ENDPT:4;
  };
  struct {
    unsigned :5;
    unsigned ENDPT1:1;
    unsigned ENDPT2:1;
    unsigned ENDPT3:1;
  };
} __U1STATbits_t;
extern volatile __U1STATbits_t U1STATbits __asm__ ("U1STAT") __attribute__((section("sfrs")));
extern volatile unsigned int U1STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1STATSET __attribute__((section("sfrs")));
extern volatile unsigned int U1STATINV __attribute__((section("sfrs")));
extern volatile unsigned int U1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned USBEN:1;
  };
  struct {
    unsigned SOFEN:1;
    unsigned PPBRST:1;
    unsigned RESUME:1;
    unsigned HOSTEN:1;
    unsigned USBRST:1;
    unsigned PKTDIS:1;
  };
  struct {
    unsigned :5;
    unsigned TOKBUSY:1;
    unsigned SE0:1;
    unsigned JSTATE:1;
  };
} __U1CONbits_t;
extern volatile __U1CONbits_t U1CONbits __asm__ ("U1CON") __attribute__((section("sfrs")));
extern volatile unsigned int U1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int U1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int U1ADDR __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned DEVADDR:7;
  };
  struct {
    unsigned DEVADDR0:1;
    unsigned DEVADDR1:1;
    unsigned DEVADDR2:1;
    unsigned DEVADDR3:1;
    unsigned DEVADDR4:1;
    unsigned DEVADDR5:1;
    unsigned DEVADDR6:1;
    unsigned LSPDEN:1;
  };
} __U1ADDRbits_t;
extern volatile __U1ADDRbits_t U1ADDRbits __asm__ ("U1ADDR") __attribute__((section("sfrs")));
extern volatile unsigned int U1ADDRCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1ADDRSET __attribute__((section("sfrs")));
extern volatile unsigned int U1ADDRINV __attribute__((section("sfrs")));
extern volatile unsigned int U1BDTP1 __attribute__((section("sfrs")));
typedef struct {
  unsigned :1;
  unsigned BDTPTRL:7;
} __U1BDTP1bits_t;
extern volatile __U1BDTP1bits_t U1BDTP1bits __asm__ ("U1BDTP1") __attribute__((section("sfrs")));
extern volatile unsigned int U1BDTP1CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1BDTP1SET __attribute__((section("sfrs")));
extern volatile unsigned int U1BDTP1INV __attribute__((section("sfrs")));
extern volatile unsigned int U1FRML __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FRML:8;
  };
  struct {
    unsigned FRM0:1;
    unsigned FRM1:1;
    unsigned FRM2:1;
    unsigned FRM3:1;
    unsigned FRM4:1;
    unsigned FRM5:1;
    unsigned FRM6:1;
    unsigned FRM7:1;
  };
} __U1FRMLbits_t;
extern volatile __U1FRMLbits_t U1FRMLbits __asm__ ("U1FRML") __attribute__((section("sfrs")));
extern volatile unsigned int U1FRMLCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1FRMLSET __attribute__((section("sfrs")));
extern volatile unsigned int U1FRMLINV __attribute__((section("sfrs")));
extern volatile unsigned int U1FRMH __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FRMH:3;
  };
  struct {
    unsigned FRM8:1;
    unsigned FRM9:1;
    unsigned FRM10:1;
  };
} __U1FRMHbits_t;
extern volatile __U1FRMHbits_t U1FRMHbits __asm__ ("U1FRMH") __attribute__((section("sfrs")));
extern volatile unsigned int U1FRMHCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1FRMHSET __attribute__((section("sfrs")));
extern volatile unsigned int U1FRMHINV __attribute__((section("sfrs")));
extern volatile unsigned int U1TOK __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EP0:1;
  };
  struct {
    unsigned EP:4;
  };
  struct {
    unsigned :1;
    unsigned EP1:1;
    unsigned EP2:1;
    unsigned EP3:1;
    unsigned PID0:1;
  };
  struct {
    unsigned :4;
    unsigned PID:4;
  };
  struct {
    unsigned :5;
    unsigned PID1:1;
    unsigned PID2:1;
    unsigned PID3:1;
  };
} __U1TOKbits_t;
extern volatile __U1TOKbits_t U1TOKbits __asm__ ("U1TOK") __attribute__((section("sfrs")));
extern volatile unsigned int U1TOKCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1TOKSET __attribute__((section("sfrs")));
extern volatile unsigned int U1TOKINV __attribute__((section("sfrs")));
extern volatile unsigned int U1SOF __attribute__((section("sfrs")));
typedef struct {
  unsigned CNT:8;
} __U1SOFbits_t;
extern volatile __U1SOFbits_t U1SOFbits __asm__ ("U1SOF") __attribute__((section("sfrs")));
extern volatile unsigned int U1SOFCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1SOFSET __attribute__((section("sfrs")));
extern volatile unsigned int U1SOFINV __attribute__((section("sfrs")));
extern volatile unsigned int U1BDTP2 __attribute__((section("sfrs")));
typedef struct {
  unsigned BDTPTRH:8;
} __U1BDTP2bits_t;
extern volatile __U1BDTP2bits_t U1BDTP2bits __asm__ ("U1BDTP2") __attribute__((section("sfrs")));
extern volatile unsigned int U1BDTP2CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1BDTP2SET __attribute__((section("sfrs")));
extern volatile unsigned int U1BDTP2INV __attribute__((section("sfrs")));
extern volatile unsigned int U1BDTP3 __attribute__((section("sfrs")));
typedef struct {
  unsigned BDTPTRU:8;
} __U1BDTP3bits_t;
extern volatile __U1BDTP3bits_t U1BDTP3bits __asm__ ("U1BDTP3") __attribute__((section("sfrs")));
extern volatile unsigned int U1BDTP3CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1BDTP3SET __attribute__((section("sfrs")));
extern volatile unsigned int U1BDTP3INV __attribute__((section("sfrs")));
extern volatile unsigned int U1CNFG1 __attribute__((section("sfrs")));
typedef struct {
  unsigned UASUSPND:1;
  unsigned :3;
  unsigned USBSIDL:1;
  unsigned USBFRZ:1;
  unsigned UOEMON:1;
  unsigned UTEYE:1;
} __U1CNFG1bits_t;
extern volatile __U1CNFG1bits_t U1CNFG1bits __asm__ ("U1CNFG1") __attribute__((section("sfrs")));
extern volatile unsigned int U1CNFG1CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1CNFG1SET __attribute__((section("sfrs")));
extern volatile unsigned int U1CNFG1INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP0 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
  unsigned :1;
  unsigned RETRYDIS:1;
  unsigned LSPD:1;
} __U1EP0bits_t;
extern volatile __U1EP0bits_t U1EP0bits __asm__ ("U1EP0") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP0CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP0SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP0INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP1 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP1bits_t;
extern volatile __U1EP1bits_t U1EP1bits __asm__ ("U1EP1") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP1CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP1SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP1INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP2 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP2bits_t;
extern volatile __U1EP2bits_t U1EP2bits __asm__ ("U1EP2") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP2CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP2SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP2INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP3 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP3bits_t;
extern volatile __U1EP3bits_t U1EP3bits __asm__ ("U1EP3") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP3CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP3SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP3INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP4 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP4bits_t;
extern volatile __U1EP4bits_t U1EP4bits __asm__ ("U1EP4") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP4CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP4SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP4INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP5 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP5bits_t;
extern volatile __U1EP5bits_t U1EP5bits __asm__ ("U1EP5") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP5CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP5SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP5INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP6 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP6bits_t;
extern volatile __U1EP6bits_t U1EP6bits __asm__ ("U1EP6") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP6CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP6SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP6INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP7 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP7bits_t;
extern volatile __U1EP7bits_t U1EP7bits __asm__ ("U1EP7") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP7CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP7SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP7INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP8 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP8bits_t;
extern volatile __U1EP8bits_t U1EP8bits __asm__ ("U1EP8") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP8CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP8SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP8INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP9 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP9bits_t;
extern volatile __U1EP9bits_t U1EP9bits __asm__ ("U1EP9") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP9CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP9SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP9INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP10 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP10bits_t;
extern volatile __U1EP10bits_t U1EP10bits __asm__ ("U1EP10") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP10CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP10SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP10INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP11 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP11bits_t;
extern volatile __U1EP11bits_t U1EP11bits __asm__ ("U1EP11") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP11CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP11SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP11INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP12 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP12bits_t;
extern volatile __U1EP12bits_t U1EP12bits __asm__ ("U1EP12") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP12CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP12SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP12INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP13 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP13bits_t;
extern volatile __U1EP13bits_t U1EP13bits __asm__ ("U1EP13") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP13CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP13SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP13INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP14 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP14bits_t;
extern volatile __U1EP14bits_t U1EP14bits __asm__ ("U1EP14") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP14CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP14SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP14INV __attribute__((section("sfrs")));
extern volatile unsigned int U1EP15 __attribute__((section("sfrs")));
typedef struct {
  unsigned EPHSHK:1;
  unsigned EPSTALL:1;
  unsigned EPTXEN:1;
  unsigned EPRXEN:1;
  unsigned EPCONDIS:1;
} __U1EP15bits_t;
extern volatile __U1EP15bits_t U1EP15bits __asm__ ("U1EP15") __attribute__((section("sfrs")));
extern volatile unsigned int U1EP15CLR __attribute__((section("sfrs")));
extern volatile unsigned int U1EP15SET __attribute__((section("sfrs")));
extern volatile unsigned int U1EP15INV __attribute__((section("sfrs")));
extern volatile unsigned int TRISA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TRISA0:1;
    unsigned TRISA1:1;
    unsigned TRISA2:1;
    unsigned TRISA3:1;
    unsigned TRISA4:1;
    unsigned TRISA5:1;
    unsigned TRISA6:1;
    unsigned TRISA7:1;
    unsigned :1;
    unsigned TRISA9:1;
    unsigned TRISA10:1;
    unsigned :3;
    unsigned TRISA14:1;
    unsigned TRISA15:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISAbits_t;
extern volatile __TRISAbits_t TRISAbits __asm__ ("TRISA") __attribute__((section("sfrs")));
extern volatile unsigned int TRISACLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISASET __attribute__((section("sfrs")));
extern volatile unsigned int TRISAINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RA0:1;
    unsigned RA1:1;
    unsigned RA2:1;
    unsigned RA3:1;
    unsigned RA4:1;
    unsigned RA5:1;
    unsigned RA6:1;
    unsigned RA7:1;
    unsigned :1;
    unsigned RA9:1;
    unsigned RA10:1;
    unsigned :3;
    unsigned RA14:1;
    unsigned RA15:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTAbits_t;
extern volatile __PORTAbits_t PORTAbits __asm__ ("PORTA") __attribute__((section("sfrs")));
extern volatile unsigned int PORTACLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTASET __attribute__((section("sfrs")));
extern volatile unsigned int PORTAINV __attribute__((section("sfrs")));
extern volatile unsigned int LATA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned LATA0:1;
    unsigned LATA1:1;
    unsigned LATA2:1;
    unsigned LATA3:1;
    unsigned LATA4:1;
    unsigned LATA5:1;
    unsigned LATA6:1;
    unsigned LATA7:1;
    unsigned :1;
    unsigned LATA9:1;
    unsigned LATA10:1;
    unsigned :3;
    unsigned LATA14:1;
    unsigned LATA15:1;
  };
  struct {
    unsigned w:32;
  };
} __LATAbits_t;
extern volatile __LATAbits_t LATAbits __asm__ ("LATA") __attribute__((section("sfrs")));
extern volatile unsigned int LATACLR __attribute__((section("sfrs")));
extern volatile unsigned int LATASET __attribute__((section("sfrs")));
extern volatile unsigned int LATAINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ODCA0:1;
    unsigned ODCA1:1;
    unsigned ODCA2:1;
    unsigned ODCA3:1;
    unsigned ODCA4:1;
    unsigned ODCA5:1;
    unsigned ODCA6:1;
    unsigned ODCA7:1;
    unsigned :1;
    unsigned ODCA9:1;
    unsigned ODCA10:1;
    unsigned :3;
    unsigned ODCA14:1;
    unsigned ODCA15:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCAbits_t;
extern volatile __ODCAbits_t ODCAbits __asm__ ("ODCA") __attribute__((section("sfrs")));
extern volatile unsigned int ODCACLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCASET __attribute__((section("sfrs")));
extern volatile unsigned int ODCAINV __attribute__((section("sfrs")));
extern volatile unsigned int TRISB __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TRISB0:1;
    unsigned TRISB1:1;
    unsigned TRISB2:1;
    unsigned TRISB3:1;
    unsigned TRISB4:1;
    unsigned TRISB5:1;
    unsigned TRISB6:1;
    unsigned TRISB7:1;
    unsigned TRISB8:1;
    unsigned TRISB9:1;
    unsigned TRISB10:1;
    unsigned TRISB11:1;
    unsigned TRISB12:1;
    unsigned TRISB13:1;
    unsigned TRISB14:1;
    unsigned TRISB15:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISBbits_t;
extern volatile __TRISBbits_t TRISBbits __asm__ ("TRISB") __attribute__((section("sfrs")));
extern volatile unsigned int TRISBCLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISBSET __attribute__((section("sfrs")));
extern volatile unsigned int TRISBINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTB __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RB0:1;
    unsigned RB1:1;
    unsigned RB2:1;
    unsigned RB3:1;
    unsigned RB4:1;
    unsigned RB5:1;
    unsigned RB6:1;
    unsigned RB7:1;
    unsigned RB8:1;
    unsigned RB9:1;
    unsigned RB10:1;
    unsigned RB11:1;
    unsigned RB12:1;
    unsigned RB13:1;
    unsigned RB14:1;
    unsigned RB15:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTBbits_t;
extern volatile __PORTBbits_t PORTBbits __asm__ ("PORTB") __attribute__((section("sfrs")));
extern volatile unsigned int PORTBCLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTBSET __attribute__((section("sfrs")));
extern volatile unsigned int PORTBINV __attribute__((section("sfrs")));
extern volatile unsigned int LATB __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned LATB0:1;
    unsigned LATB1:1;
    unsigned LATB2:1;
    unsigned LATB3:1;
    unsigned LATB4:1;
    unsigned LATB5:1;
    unsigned LATB6:1;
    unsigned LATB7:1;
    unsigned LATB8:1;
    unsigned LATB9:1;
    unsigned LATB10:1;
    unsigned LATB11:1;
    unsigned LATB12:1;
    unsigned LATB13:1;
    unsigned LATB14:1;
    unsigned LATB15:1;
  };
  struct {
    unsigned w:32;
  };
} __LATBbits_t;
extern volatile __LATBbits_t LATBbits __asm__ ("LATB") __attribute__((section("sfrs")));
extern volatile unsigned int LATBCLR __attribute__((section("sfrs")));
extern volatile unsigned int LATBSET __attribute__((section("sfrs")));
extern volatile unsigned int LATBINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCB __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ODCB0:1;
    unsigned ODCB1:1;
    unsigned ODCB2:1;
    unsigned ODCB3:1;
    unsigned ODCB4:1;
    unsigned ODCB5:1;
    unsigned ODCB6:1;
    unsigned ODCB7:1;
    unsigned ODCB8:1;
    unsigned ODCB9:1;
    unsigned ODCB10:1;
    unsigned ODCB11:1;
    unsigned ODCB12:1;
    unsigned ODCB13:1;
    unsigned ODCB14:1;
    unsigned ODCB15:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCBbits_t;
extern volatile __ODCBbits_t ODCBbits __asm__ ("ODCB") __attribute__((section("sfrs")));
extern volatile unsigned int ODCBCLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCBSET __attribute__((section("sfrs")));
extern volatile unsigned int ODCBINV __attribute__((section("sfrs")));
extern volatile unsigned int TRISC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned TRISC1:1;
    unsigned TRISC2:1;
    unsigned TRISC3:1;
    unsigned TRISC4:1;
    unsigned :7;
    unsigned TRISC12:1;
    unsigned TRISC13:1;
    unsigned TRISC14:1;
    unsigned TRISC15:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISCbits_t;
extern volatile __TRISCbits_t TRISCbits __asm__ ("TRISC") __attribute__((section("sfrs")));
extern volatile unsigned int TRISCCLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISCSET __attribute__((section("sfrs")));
extern volatile unsigned int TRISCINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned RC1:1;
    unsigned RC2:1;
    unsigned RC3:1;
    unsigned RC4:1;
    unsigned :7;
    unsigned RC12:1;
    unsigned RC13:1;
    unsigned RC14:1;
    unsigned RC15:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTCbits_t;
extern volatile __PORTCbits_t PORTCbits __asm__ ("PORTC") __attribute__((section("sfrs")));
extern volatile unsigned int PORTCCLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTCSET __attribute__((section("sfrs")));
extern volatile unsigned int PORTCINV __attribute__((section("sfrs")));
extern volatile unsigned int LATC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned LATC1:1;
    unsigned LATC2:1;
    unsigned LATC3:1;
    unsigned LATC4:1;
    unsigned :7;
    unsigned LATC12:1;
    unsigned LATC13:1;
    unsigned LATC14:1;
    unsigned LATC15:1;
  };
  struct {
    unsigned w:32;
  };
} __LATCbits_t;
extern volatile __LATCbits_t LATCbits __asm__ ("LATC") __attribute__((section("sfrs")));
extern volatile unsigned int LATCCLR __attribute__((section("sfrs")));
extern volatile unsigned int LATCSET __attribute__((section("sfrs")));
extern volatile unsigned int LATCINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned ODCC1:1;
    unsigned ODCC2:1;
    unsigned ODCC3:1;
    unsigned ODCC4:1;
    unsigned :7;
    unsigned ODCC12:1;
    unsigned ODCC13:1;
    unsigned ODCC14:1;
    unsigned ODCC15:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCCbits_t;
extern volatile __ODCCbits_t ODCCbits __asm__ ("ODCC") __attribute__((section("sfrs")));
extern volatile unsigned int ODCCCLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCCSET __attribute__((section("sfrs")));
extern volatile unsigned int ODCCINV __attribute__((section("sfrs")));
extern volatile unsigned int TRISD __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TRISD0:1;
    unsigned TRISD1:1;
    unsigned TRISD2:1;
    unsigned TRISD3:1;
    unsigned TRISD4:1;
    unsigned TRISD5:1;
    unsigned TRISD6:1;
    unsigned TRISD7:1;
    unsigned TRISD8:1;
    unsigned TRISD9:1;
    unsigned TRISD10:1;
    unsigned TRISD11:1;
    unsigned TRISD12:1;
    unsigned TRISD13:1;
    unsigned TRISD14:1;
    unsigned TRISD15:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISDbits_t;
extern volatile __TRISDbits_t TRISDbits __asm__ ("TRISD") __attribute__((section("sfrs")));
extern volatile unsigned int TRISDCLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISDSET __attribute__((section("sfrs")));
extern volatile unsigned int TRISDINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTD __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RD0:1;
    unsigned RD1:1;
    unsigned RD2:1;
    unsigned RD3:1;
    unsigned RD4:1;
    unsigned RD5:1;
    unsigned RD6:1;
    unsigned RD7:1;
    unsigned RD8:1;
    unsigned RD9:1;
    unsigned RD10:1;
    unsigned RD11:1;
    unsigned RD12:1;
    unsigned RD13:1;
    unsigned RD14:1;
    unsigned RD15:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTDbits_t;
extern volatile __PORTDbits_t PORTDbits __asm__ ("PORTD") __attribute__((section("sfrs")));
extern volatile unsigned int PORTDCLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTDSET __attribute__((section("sfrs")));
extern volatile unsigned int PORTDINV __attribute__((section("sfrs")));
extern volatile unsigned int LATD __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned LATD0:1;
    unsigned LATD1:1;
    unsigned LATD2:1;
    unsigned LATD3:1;
    unsigned LATD4:1;
    unsigned LATD5:1;
    unsigned LATD6:1;
    unsigned LATD7:1;
    unsigned LATD8:1;
    unsigned LATD9:1;
    unsigned LATD10:1;
    unsigned LATD11:1;
    unsigned LATD12:1;
    unsigned LATD13:1;
    unsigned LATD14:1;
    unsigned LATD15:1;
  };
  struct {
    unsigned w:32;
  };
} __LATDbits_t;
extern volatile __LATDbits_t LATDbits __asm__ ("LATD") __attribute__((section("sfrs")));
extern volatile unsigned int LATDCLR __attribute__((section("sfrs")));
extern volatile unsigned int LATDSET __attribute__((section("sfrs")));
extern volatile unsigned int LATDINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCD __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ODCD0:1;
    unsigned ODCD1:1;
    unsigned ODCD2:1;
    unsigned ODCD3:1;
    unsigned ODCD4:1;
    unsigned ODCD5:1;
    unsigned ODCD6:1;
    unsigned ODCD7:1;
    unsigned ODCD8:1;
    unsigned ODCD9:1;
    unsigned ODCD10:1;
    unsigned ODCD11:1;
    unsigned ODCD12:1;
    unsigned ODCD13:1;
    unsigned ODCD14:1;
    unsigned ODCD15:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCDbits_t;
extern volatile __ODCDbits_t ODCDbits __asm__ ("ODCD") __attribute__((section("sfrs")));
extern volatile unsigned int ODCDCLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCDSET __attribute__((section("sfrs")));
extern volatile unsigned int ODCDINV __attribute__((section("sfrs")));
extern volatile unsigned int TRISE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TRISE0:1;
    unsigned TRISE1:1;
    unsigned TRISE2:1;
    unsigned TRISE3:1;
    unsigned TRISE4:1;
    unsigned TRISE5:1;
    unsigned TRISE6:1;
    unsigned TRISE7:1;
    unsigned TRISE8:1;
    unsigned TRISE9:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISEbits_t;
extern volatile __TRISEbits_t TRISEbits __asm__ ("TRISE") __attribute__((section("sfrs")));
extern volatile unsigned int TRISECLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISESET __attribute__((section("sfrs")));
extern volatile unsigned int TRISEINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RE0:1;
    unsigned RE1:1;
    unsigned RE2:1;
    unsigned RE3:1;
    unsigned RE4:1;
    unsigned RE5:1;
    unsigned RE6:1;
    unsigned RE7:1;
    unsigned RE8:1;
    unsigned RE9:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTEbits_t;
extern volatile __PORTEbits_t PORTEbits __asm__ ("PORTE") __attribute__((section("sfrs")));
extern volatile unsigned int PORTECLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTESET __attribute__((section("sfrs")));
extern volatile unsigned int PORTEINV __attribute__((section("sfrs")));
extern volatile unsigned int LATE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned LATE0:1;
    unsigned LATE1:1;
    unsigned LATE2:1;
    unsigned LATE3:1;
    unsigned LATE4:1;
    unsigned LATE5:1;
    unsigned LATE6:1;
    unsigned LATE7:1;
    unsigned LATE8:1;
    unsigned LATE9:1;
  };
  struct {
    unsigned w:32;
  };
} __LATEbits_t;
extern volatile __LATEbits_t LATEbits __asm__ ("LATE") __attribute__((section("sfrs")));
extern volatile unsigned int LATECLR __attribute__((section("sfrs")));
extern volatile unsigned int LATESET __attribute__((section("sfrs")));
extern volatile unsigned int LATEINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ODCE0:1;
    unsigned ODCE1:1;
    unsigned ODCE2:1;
    unsigned ODCE3:1;
    unsigned ODCE4:1;
    unsigned ODCE5:1;
    unsigned ODCE6:1;
    unsigned ODCE7:1;
    unsigned ODCE8:1;
    unsigned ODCE9:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCEbits_t;
extern volatile __ODCEbits_t ODCEbits __asm__ ("ODCE") __attribute__((section("sfrs")));
extern volatile unsigned int ODCECLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCESET __attribute__((section("sfrs")));
extern volatile unsigned int ODCEINV __attribute__((section("sfrs")));
extern volatile unsigned int TRISF __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TRISF0:1;
    unsigned TRISF1:1;
    unsigned TRISF2:1;
    unsigned TRISF3:1;
    unsigned TRISF4:1;
    unsigned TRISF5:1;
    unsigned TRISF6:1;
    unsigned TRISF7:1;
    unsigned TRISF8:1;
    unsigned :3;
    unsigned TRISF12:1;
    unsigned TRISF13:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISFbits_t;
extern volatile __TRISFbits_t TRISFbits __asm__ ("TRISF") __attribute__((section("sfrs")));
extern volatile unsigned int TRISFCLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISFSET __attribute__((section("sfrs")));
extern volatile unsigned int TRISFINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTF __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RF0:1;
    unsigned RF1:1;
    unsigned RF2:1;
    unsigned RF3:1;
    unsigned RF4:1;
    unsigned RF5:1;
    unsigned RF6:1;
    unsigned RF7:1;
    unsigned RF8:1;
    unsigned :3;
    unsigned RF12:1;
    unsigned RF13:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTFbits_t;
extern volatile __PORTFbits_t PORTFbits __asm__ ("PORTF") __attribute__((section("sfrs")));
extern volatile unsigned int PORTFCLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTFSET __attribute__((section("sfrs")));
extern volatile unsigned int PORTFINV __attribute__((section("sfrs")));
extern volatile unsigned int LATF __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned LATF0:1;
    unsigned LATF1:1;
    unsigned LATF2:1;
    unsigned LATF3:1;
    unsigned LATF4:1;
    unsigned LATF5:1;
    unsigned LATF6:1;
    unsigned LATF7:1;
    unsigned LATF8:1;
    unsigned :3;
    unsigned LATF12:1;
    unsigned LATF13:1;
  };
  struct {
    unsigned w:32;
  };
} __LATFbits_t;
extern volatile __LATFbits_t LATFbits __asm__ ("LATF") __attribute__((section("sfrs")));
extern volatile unsigned int LATFCLR __attribute__((section("sfrs")));
extern volatile unsigned int LATFSET __attribute__((section("sfrs")));
extern volatile unsigned int LATFINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCF __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ODCF0:1;
    unsigned ODCF1:1;
    unsigned ODCF2:1;
    unsigned ODCF3:1;
    unsigned ODCF4:1;
    unsigned ODCF5:1;
    unsigned ODCF6:1;
    unsigned ODCF7:1;
    unsigned ODCF8:1;
    unsigned :3;
    unsigned ODCF12:1;
    unsigned ODCF13:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCFbits_t;
extern volatile __ODCFbits_t ODCFbits __asm__ ("ODCF") __attribute__((section("sfrs")));
extern volatile unsigned int ODCFCLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCFSET __attribute__((section("sfrs")));
extern volatile unsigned int ODCFINV __attribute__((section("sfrs")));
extern volatile unsigned int TRISG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TRISG0:1;
    unsigned TRISG1:1;
    unsigned TRISG2:1;
    unsigned TRISG3:1;
    unsigned :2;
    unsigned TRISG6:1;
    unsigned TRISG7:1;
    unsigned TRISG8:1;
    unsigned TRISG9:1;
    unsigned :2;
    unsigned TRISG12:1;
    unsigned TRISG13:1;
    unsigned TRISG14:1;
    unsigned TRISG15:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISGbits_t;
extern volatile __TRISGbits_t TRISGbits __asm__ ("TRISG") __attribute__((section("sfrs")));
extern volatile unsigned int TRISGCLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISGSET __attribute__((section("sfrs")));
extern volatile unsigned int TRISGINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RG0:1;
    unsigned RG1:1;
    unsigned RG2:1;
    unsigned RG3:1;
    unsigned :2;
    unsigned RG6:1;
    unsigned RG7:1;
    unsigned RG8:1;
    unsigned RG9:1;
    unsigned :2;
    unsigned RG12:1;
    unsigned RG13:1;
    unsigned RG14:1;
    unsigned RG15:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTGbits_t;
extern volatile __PORTGbits_t PORTGbits __asm__ ("PORTG") __attribute__((section("sfrs")));
extern volatile unsigned int PORTGCLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTGSET __attribute__((section("sfrs")));
extern volatile unsigned int PORTGINV __attribute__((section("sfrs")));
extern volatile unsigned int LATG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned LATG0:1;
    unsigned LATG1:1;
    unsigned LATG2:1;
    unsigned LATG3:1;
    unsigned :2;
    unsigned LATG6:1;
    unsigned LATG7:1;
    unsigned LATG8:1;
    unsigned LATG9:1;
    unsigned :2;
    unsigned LATG12:1;
    unsigned LATG13:1;
    unsigned LATG14:1;
    unsigned LATG15:1;
  };
  struct {
    unsigned w:32;
  };
} __LATGbits_t;
extern volatile __LATGbits_t LATGbits __asm__ ("LATG") __attribute__((section("sfrs")));
extern volatile unsigned int LATGCLR __attribute__((section("sfrs")));
extern volatile unsigned int LATGSET __attribute__((section("sfrs")));
extern volatile unsigned int LATGINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ODCG0:1;
    unsigned ODCG1:1;
    unsigned ODCG2:1;
    unsigned ODCG3:1;
    unsigned :2;
    unsigned ODCG6:1;
    unsigned ODCG7:1;
    unsigned ODCG8:1;
    unsigned ODCG9:1;
    unsigned :2;
    unsigned ODCG12:1;
    unsigned ODCG13:1;
    unsigned ODCG14:1;
    unsigned ODCG15:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCGbits_t;
extern volatile __ODCGbits_t ODCGbits __asm__ ("ODCG") __attribute__((section("sfrs")));
extern volatile unsigned int ODCGCLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCGSET __attribute__((section("sfrs")));
extern volatile unsigned int ODCGINV __attribute__((section("sfrs")));
extern volatile unsigned int CNCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :13;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned w:32;
  };
} __CNCONbits_t;
extern volatile __CNCONbits_t CNCONbits __asm__ ("CNCON") __attribute__((section("sfrs")));
extern volatile unsigned int CNCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int CNCONSET __attribute__((section("sfrs")));
extern volatile unsigned int CNCONINV __attribute__((section("sfrs")));
extern volatile unsigned int CNEN __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CNEN0:1;
    unsigned CNEN1:1;
    unsigned CNEN2:1;
    unsigned CNEN3:1;
    unsigned CNEN4:1;
    unsigned CNEN5:1;
    unsigned CNEN6:1;
    unsigned CNEN7:1;
    unsigned CNEN8:1;
    unsigned CNEN9:1;
    unsigned CNEN10:1;
    unsigned CNEN11:1;
    unsigned CNEN12:1;
    unsigned CNEN13:1;
    unsigned CNEN14:1;
    unsigned CNEN15:1;
    unsigned CNEN16:1;
    unsigned CNEN17:1;
    unsigned CNEN18:1;
    unsigned CNEN19:1;
    unsigned CNEN20:1;
    unsigned CNEN21:1;
  };
  struct {
    unsigned w:32;
  };
} __CNENbits_t;
extern volatile __CNENbits_t CNENbits __asm__ ("CNEN") __attribute__((section("sfrs")));
extern volatile unsigned int CNENCLR __attribute__((section("sfrs")));
extern volatile unsigned int CNENSET __attribute__((section("sfrs")));
extern volatile unsigned int CNENINV __attribute__((section("sfrs")));
extern volatile unsigned int CNPUE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CNPUE0:1;
    unsigned CNPUE1:1;
    unsigned CNPUE2:1;
    unsigned CNPUE3:1;
    unsigned CNPUE4:1;
    unsigned CNPUE5:1;
    unsigned CNPUE6:1;
    unsigned CNPUE7:1;
    unsigned CNPUE8:1;
    unsigned CNPUE9:1;
    unsigned CNPUE10:1;
    unsigned CNPUE11:1;
    unsigned CNPUE12:1;
    unsigned CNPUE13:1;
    unsigned CNPUE14:1;
    unsigned CNPUE15:1;
    unsigned CNPUE16:1;
    unsigned CNPUE17:1;
    unsigned CNPUE18:1;
    unsigned CNPUE19:1;
    unsigned CNPUE20:1;
    unsigned CNPUE21:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPUEbits_t;
extern volatile __CNPUEbits_t CNPUEbits __asm__ ("CNPUE") __attribute__((section("sfrs")));
extern volatile unsigned int CNPUECLR __attribute__((section("sfrs")));
extern volatile unsigned int CNPUESET __attribute__((section("sfrs")));
extern volatile unsigned int CNPUEINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHCON1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned BUFCDEC:1;
    unsigned :3;
    unsigned MANFC:1;
    unsigned :2;
    unsigned AUTOFC:1;
    unsigned RXEN:1;
    unsigned TXRTS:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned PTV:16;
  };
  struct {
    unsigned w:32;
  };
} __ETHCON1bits_t;
extern volatile __ETHCON1bits_t ETHCON1bits __asm__ ("ETHCON1") __attribute__((section("sfrs")));
extern volatile unsigned int ETHCON1CLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHCON1SET __attribute__((section("sfrs")));
extern volatile unsigned int ETHCON1INV __attribute__((section("sfrs")));
extern volatile unsigned int ETHCON2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :4;
    unsigned RXBUF_SZ:7;
  };
  struct {
    unsigned w:32;
  };
} __ETHCON2bits_t;
extern volatile __ETHCON2bits_t ETHCON2bits __asm__ ("ETHCON2") __attribute__((section("sfrs")));
extern volatile unsigned int ETHCON2CLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHCON2SET __attribute__((section("sfrs")));
extern volatile unsigned int ETHCON2INV __attribute__((section("sfrs")));
extern volatile unsigned int ETHTXST __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :2;
    unsigned TXSTADDR:30;
  };
  struct {
    unsigned w:32;
  };
} __ETHTXSTbits_t;
extern volatile __ETHTXSTbits_t ETHTXSTbits __asm__ ("ETHTXST") __attribute__((section("sfrs")));
extern volatile unsigned int ETHTXSTCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHTXSTSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHTXSTINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXST __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :2;
    unsigned RXSTADDR:30;
  };
  struct {
    unsigned w:32;
  };
} __ETHRXSTbits_t;
extern volatile __ETHRXSTbits_t ETHRXSTbits __asm__ ("ETHRXST") __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXSTCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXSTSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXSTINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHHT0 __attribute__((section("sfrs")));
extern volatile unsigned int ETHHT0CLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHHT0SET __attribute__((section("sfrs")));
extern volatile unsigned int ETHHT0INV __attribute__((section("sfrs")));
extern volatile unsigned int ETHHT1 __attribute__((section("sfrs")));
extern volatile unsigned int ETHHT1CLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHHT1SET __attribute__((section("sfrs")));
extern volatile unsigned int ETHHT1INV __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMM0 __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMM0CLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMM0SET __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMM0INV __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMM1 __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMM1CLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMM1SET __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMM1INV __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMCS __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PMCS:16;
  };
  struct {
    unsigned w:32;
  };
} __ETHPMCSbits_t;
extern volatile __ETHPMCSbits_t ETHPMCSbits __asm__ ("ETHPMCS") __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMCSCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMCSSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMCSINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMO __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PMO:16;
  };
  struct {
    unsigned w:32;
  };
} __ETHPMObits_t;
extern volatile __ETHPMObits_t ETHPMObits __asm__ ("ETHPMO") __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMOCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMOSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHPMOINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXFC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned BCEN:1;
    unsigned MCEN:1;
    unsigned NOTMEEN:1;
    unsigned UCEN:1;
    unsigned RUNTEN:1;
    unsigned RUNTERREN:1;
    unsigned CRCOKEN:1;
    unsigned CRCERREN:1;
    unsigned PMMODE:4;
    unsigned NOTPM:1;
    unsigned :1;
    unsigned MPEN:1;
    unsigned HTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __ETHRXFCbits_t;
extern volatile __ETHRXFCbits_t ETHRXFCbits __asm__ ("ETHRXFC") __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXFCCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXFCSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXFCINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXWM __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXEWM:8;
    unsigned :8;
    unsigned RXFWM:8;
  };
  struct {
    unsigned w:32;
  };
} __ETHRXWMbits_t;
extern volatile __ETHRXWMbits_t ETHRXWMbits __asm__ ("ETHRXWM") __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXWMCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXWMSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXWMINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHIEN __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXOVFLWIE:1;
    unsigned RXBUFNAIE:1;
    unsigned TXABORTIE:1;
    unsigned TXDONEIE:1;
    unsigned :1;
    unsigned RXACTIE:1;
    unsigned PKTPENDIE:1;
    unsigned RXDONEIE:1;
    unsigned FWMARKIE:1;
    unsigned EWMARKIE:1;
    unsigned :3;
    unsigned RXBUSEIE:1;
    unsigned TXBUSEIE:1;
  };
  struct {
    unsigned w:32;
  };
} __ETHIENbits_t;
extern volatile __ETHIENbits_t ETHIENbits __asm__ ("ETHIEN") __attribute__((section("sfrs")));
extern volatile unsigned int ETHIENCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHIENSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHIENINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHIRQ __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXOVFLW:1;
    unsigned RXBUFNA:1;
    unsigned TXABORT:1;
    unsigned TXDONE:1;
    unsigned :1;
    unsigned RXACT:1;
    unsigned PKTPEND:1;
    unsigned RXDONE:1;
    unsigned FWMARK:1;
    unsigned EWMARK:1;
    unsigned :3;
    unsigned RXBUSE:1;
    unsigned TXBUSE:1;
  };
  struct {
    unsigned w:32;
  };
} __ETHIRQbits_t;
extern volatile __ETHIRQbits_t ETHIRQbits __asm__ ("ETHIRQ") __attribute__((section("sfrs")));
extern volatile unsigned int ETHIRQCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHIRQSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHIRQINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHSTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :5;
    unsigned RXBUSY:1;
    unsigned TXBUSY:1;
    unsigned ETHBUSY:1;
    unsigned :8;
    unsigned BUFCNT:8;
  };
  struct {
    unsigned w:32;
  };
} __ETHSTATbits_t;
extern volatile __ETHSTATbits_t ETHSTATbits __asm__ ("ETHSTAT") __attribute__((section("sfrs")));
extern volatile unsigned int ETHSTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHSTATSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHSTATINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXOVFLOW __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXOVFLWCNT:16;
  };
  struct {
    unsigned w:32;
  };
} __ETHRXOVFLOWbits_t;
extern volatile __ETHRXOVFLOWbits_t ETHRXOVFLOWbits __asm__ ("ETHRXOVFLOW") __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXOVFLOWCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXOVFLOWSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHRXOVFLOWINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHFRMTXOK __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FRMTXOKCNT:16;
  };
  struct {
    unsigned w:32;
  };
} __ETHFRMTXOKbits_t;
extern volatile __ETHFRMTXOKbits_t ETHFRMTXOKbits __asm__ ("ETHFRMTXOK") __attribute__((section("sfrs")));
extern volatile unsigned int ETHFRMTXOKCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHFRMTXOKSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHFRMTXOKINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHSCOLFRM __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SCOLFRMCNT:16;
  };
  struct {
    unsigned w:32;
  };
} __ETHSCOLFRMbits_t;
extern volatile __ETHSCOLFRMbits_t ETHSCOLFRMbits __asm__ ("ETHSCOLFRM") __attribute__((section("sfrs")));
extern volatile unsigned int ETHSCOLFRMCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHSCOLFRMSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHSCOLFRMINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHMCOLFRM __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned MCOLFRM_CNT:16;
  };
  struct {
    unsigned w:32;
  };
} __ETHMCOLFRMbits_t;
extern volatile __ETHMCOLFRMbits_t ETHMCOLFRMbits __asm__ ("ETHMCOLFRM") __attribute__((section("sfrs")));
extern volatile unsigned int ETHMCOLFRMCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHMCOLFRMSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHMCOLFRMINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHFRMRXOK __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FRMRXOKCNT:16;
  };
  struct {
    unsigned w:32;
  };
} __ETHFRMRXOKbits_t;
extern volatile __ETHFRMRXOKbits_t ETHFRMRXOKbits __asm__ ("ETHFRMRXOK") __attribute__((section("sfrs")));
extern volatile unsigned int ETHFRMRXOKCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHFRMRXOKSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHFRMRXOKINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHFCSERR __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FCSERRCNT:16;
  };
  struct {
    unsigned w:32;
  };
} __ETHFCSERRbits_t;
extern volatile __ETHFCSERRbits_t ETHFCSERRbits __asm__ ("ETHFCSERR") __attribute__((section("sfrs")));
extern volatile unsigned int ETHFCSERRCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHFCSERRSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHFCSERRINV __attribute__((section("sfrs")));
extern volatile unsigned int ETHALGNERR __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ALGNERRCNT:16;
  };
  struct {
    unsigned w:32;
  };
} __ETHALGNERRbits_t;
extern volatile __ETHALGNERRbits_t ETHALGNERRbits __asm__ ("ETHALGNERR") __attribute__((section("sfrs")));
extern volatile unsigned int ETHALGNERRCLR __attribute__((section("sfrs")));
extern volatile unsigned int ETHALGNERRSET __attribute__((section("sfrs")));
extern volatile unsigned int ETHALGNERRINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxCFG1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXENABLE:1;
    unsigned PASSALL:1;
    unsigned RXPAUSE:1;
    unsigned TXPAUSE:1;
    unsigned LOOPBACK:1;
    unsigned :3;
    unsigned RESETTFUN:1;
    unsigned RESETTMCS:1;
    unsigned RESETRFUN:1;
    unsigned RESETRMCS:1;
    unsigned :2;
    unsigned SIMRESET:1;
    unsigned SOFTRESET:1;
  };
  struct {
    unsigned w:32;
  };
} __EMACxCFG1bits_t;
extern volatile __EMACxCFG1bits_t EMACxCFG1bits __asm__ ("EMACxCFG1") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxCFG1CLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxCFG1SET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxCFG1INV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxCFG2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FULLDPLX:1;
    unsigned LENGTHCK:1;
    unsigned HUGEFRM:1;
    unsigned DELAYCRC:1;
    unsigned CRCENABLE:1;
    unsigned PADENABLE:1;
    unsigned VLANPAD:1;
    unsigned AUTOPAD:1;
    unsigned PUREPRE:1;
    unsigned LONGPRE:1;
    unsigned :2;
    unsigned NOBKOFF:1;
    unsigned BPNOBKOFF:1;
    unsigned EXCESSDFR:1;
  };
  struct {
    unsigned w:32;
  };
} __EMACxCFG2bits_t;
extern volatile __EMACxCFG2bits_t EMACxCFG2bits __asm__ ("EMACxCFG2") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxCFG2CLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxCFG2SET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxCFG2INV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxIPGT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned B2BIPKTGP:7;
  };
  struct {
    unsigned w:32;
  };
} __EMACxIPGTbits_t;
extern volatile __EMACxIPGTbits_t EMACxIPGTbits __asm__ ("EMACxIPGT") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxIPGTCLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxIPGTSET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxIPGTINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxIPGR __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned NB2BIPKTGP2:7;
    unsigned :1;
    unsigned NB2BIPKTGP1:7;
  };
  struct {
    unsigned w:32;
  };
} __EMACxIPGRbits_t;
extern volatile __EMACxIPGRbits_t EMACxIPGRbits __asm__ ("EMACxIPGR") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxIPGRCLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxIPGRSET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxIPGRINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxCLRT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RETX:4;
    unsigned :4;
    unsigned CWINDOW:6;
  };
  struct {
    unsigned w:32;
  };
} __EMACxCLRTbits_t;
extern volatile __EMACxCLRTbits_t EMACxCLRTbits __asm__ ("EMACxCLRT") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxCLRTCLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxCLRTSET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxCLRTINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMAXF __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned MACMAXF:16;
  };
  struct {
    unsigned w:32;
  };
} __EMACxMAXFbits_t;
extern volatile __EMACxMAXFbits_t EMACxMAXFbits __asm__ ("EMACxMAXF") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMAXFCLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMAXFSET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMAXFINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSUPP __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :8;
    unsigned SPEEDRMII:1;
    unsigned :2;
    unsigned RESETRMII:1;
  };
  struct {
    unsigned w:32;
  };
} __EMACxSUPPbits_t;
extern volatile __EMACxSUPPbits_t EMACxSUPPbits __asm__ ("EMACxSUPP") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSUPPCLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSUPPSET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSUPPINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxTEST __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SHRTQNTA:1;
    unsigned TESTPAUSE:1;
    unsigned TESTBP:1;
  };
  struct {
    unsigned w:32;
  };
} __EMACxTESTbits_t;
extern volatile __EMACxTESTbits_t EMACxTESTbits __asm__ ("EMACxTEST") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxTESTCLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxTESTSET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxTESTINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMCFG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SCANINC:1;
    unsigned NOPRE:1;
    unsigned CLKSEL:4;
    unsigned :9;
    unsigned RESETMGMT:1;
  };
  struct {
    unsigned w:32;
  };
} __EMACxMCFGbits_t;
extern volatile __EMACxMCFGbits_t EMACxMCFGbits __asm__ ("EMACxMCFG") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMCFGCLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMCFGSET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMCFGINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMCMD __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned READ:1;
    unsigned SCAN:1;
  };
  struct {
    unsigned w:32;
  };
} __EMACxMCMDbits_t;
extern volatile __EMACxMCMDbits_t EMACxMCMDbits __asm__ ("EMACxMCMD") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMCMDCLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMCMDSET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMCMDINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMADR __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned REGADDR:5;
    unsigned :3;
    unsigned PHYADDR:5;
  };
  struct {
    unsigned w:32;
  };
} __EMACxMADRbits_t;
extern volatile __EMACxMADRbits_t EMACxMADRbits __asm__ ("EMACxMADR") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMADRCLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMADRSET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMADRINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMWTD __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned MWTD:16;
  };
  struct {
    unsigned w:32;
  };
} __EMACxMWTDbits_t;
extern volatile __EMACxMWTDbits_t EMACxMWTDbits __asm__ ("EMACxMWTD") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMWTDCLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMWTDSET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMWTDINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMRDD __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned MRDD:16;
  };
  struct {
    unsigned w:32;
  };
} __EMACxMRDDbits_t;
extern volatile __EMACxMRDDbits_t EMACxMRDDbits __asm__ ("EMACxMRDD") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMRDDCLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMRDDSET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMRDDINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMIND __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned MIIMBUSY:1;
    unsigned SCAN:1;
    unsigned NOTVALID:1;
    unsigned LINKFAIL:1;
  };
  struct {
    unsigned w:32;
  };
} __EMACxMINDbits_t;
extern volatile __EMACxMINDbits_t EMACxMINDbits __asm__ ("EMACxMIND") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMINDCLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMINDSET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxMINDINV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSA0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STNADDR5:8;
    unsigned STNADDR6:8;
  };
  struct {
    unsigned w:32;
  };
} __EMACxSA0bits_t;
extern volatile __EMACxSA0bits_t EMACxSA0bits __asm__ ("EMACxSA0") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSA0CLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSA0SET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSA0INV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSA1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STNADDR3:8;
    unsigned STNADDR4:8;
  };
  struct {
    unsigned w:32;
  };
} __EMACxSA1bits_t;
extern volatile __EMACxSA1bits_t EMACxSA1bits __asm__ ("EMACxSA1") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSA1CLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSA1SET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSA1INV __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSA2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STNADDR1:8;
    unsigned STNADDR2:8;
  };
  struct {
    unsigned w:32;
  };
} __EMACxSA2bits_t;
extern volatile __EMACxSA2bits_t EMACxSA2bits __asm__ ("EMACxSA2") __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSA2CLR __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSA2SET __attribute__((section("sfrs")));
extern volatile unsigned int EMACxSA2INV __attribute__((section("sfrs")));
extern volatile unsigned int C1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned DNCNT:5;
    unsigned :6;
    unsigned CANBUSY:1;
    unsigned :1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned :4;
    unsigned CANCAP:1;
    unsigned OPMOD:3;
    unsigned REQOP:3;
    unsigned ABAT:1;
  };
  struct {
    unsigned w:32;
  };
} __C1CONbits_t;
extern volatile __C1CONbits_t C1CONbits __asm__ ("C1CON") __attribute__((section("sfrs")));
extern volatile unsigned int C1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int C1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int C1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int C1CFG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned BRP:6;
    unsigned SJW:2;
    unsigned PRSEG:3;
    unsigned SEG1PH:3;
    unsigned SAM:1;
    unsigned SEG2PHTS:1;
    unsigned SEG2PH:3;
    unsigned :3;
    unsigned WAKFIL:1;
  };
  struct {
    unsigned w:32;
  };
} __C1CFGbits_t;
extern volatile __C1CFGbits_t C1CFGbits __asm__ ("C1CFG") __attribute__((section("sfrs")));
extern volatile unsigned int C1CFGCLR __attribute__((section("sfrs")));
extern volatile unsigned int C1CFGSET __attribute__((section("sfrs")));
extern volatile unsigned int C1CFGINV __attribute__((section("sfrs")));
extern volatile unsigned int C1INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TBIF:1;
    unsigned RBIF:1;
    unsigned CTMRIF:1;
    unsigned MODIF:1;
    unsigned :7;
    unsigned RBOVIF:1;
    unsigned SERRIF:1;
    unsigned CERRIF:1;
    unsigned WAKIF:1;
    unsigned IVRIF:1;
    unsigned TBIE:1;
    unsigned RBIE:1;
    unsigned CTMRIE:1;
    unsigned MODIE:1;
    unsigned :7;
    unsigned RBOVIE:1;
    unsigned SERRIE:1;
    unsigned CERRIE:1;
    unsigned WAKIE:1;
    unsigned IVRIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1INTbits_t;
extern volatile __C1INTbits_t C1INTbits __asm__ ("C1INT") __attribute__((section("sfrs")));
extern volatile unsigned int C1INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int C1INTSET __attribute__((section("sfrs")));
extern volatile unsigned int C1INTINV __attribute__((section("sfrs")));
extern volatile unsigned int C1VEC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ICODE:7;
    unsigned :1;
    unsigned FILHIT:5;
  };
  struct {
    unsigned w:32;
  };
} __C1VECbits_t;
extern volatile __C1VECbits_t C1VECbits __asm__ ("C1VEC") __attribute__((section("sfrs")));
extern volatile unsigned int C1VECCLR __attribute__((section("sfrs")));
extern volatile unsigned int C1VECSET __attribute__((section("sfrs")));
extern volatile unsigned int C1VECINV __attribute__((section("sfrs")));
extern volatile unsigned int C1TREC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RERRCNT:8;
    unsigned TERRCNT:8;
    unsigned EWARN:1;
    unsigned RXWARN:1;
    unsigned TXWARN:1;
    unsigned RXBP:1;
    unsigned TXBP:1;
    unsigned TXBO:1;
  };
  struct {
    unsigned w:32;
  };
} __C1TRECbits_t;
extern volatile __C1TRECbits_t C1TRECbits __asm__ ("C1TREC") __attribute__((section("sfrs")));
extern volatile unsigned int C1TRECCLR __attribute__((section("sfrs")));
extern volatile unsigned int C1TRECSET __attribute__((section("sfrs")));
extern volatile unsigned int C1TRECINV __attribute__((section("sfrs")));
extern volatile unsigned int C1FSTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FIFOIP0:1;
    unsigned FIFOIP1:1;
    unsigned FIFOIP2:1;
    unsigned FIFOIP3:1;
    unsigned FIFOIP4:1;
    unsigned FIFOIP5:1;
    unsigned FIFOIP6:1;
    unsigned FIFOIP7:1;
    unsigned FIFOIP8:1;
    unsigned FIFOIP9:1;
    unsigned FIFOIP10:1;
    unsigned FIFOIP11:1;
    unsigned FIFOIP12:1;
    unsigned FIFOIP13:1;
    unsigned FIFOIP14:1;
    unsigned FIFOIP15:1;
    unsigned FIFOIP16:1;
    unsigned FIFOIP17:1;
    unsigned FIFOIP18:1;
    unsigned FIFOIP19:1;
    unsigned FIFOIP20:1;
    unsigned FIFOIP21:1;
    unsigned FIFOIP22:1;
    unsigned FIFOIP23:1;
    unsigned FIFOIP24:1;
    unsigned FIFOIP25:1;
    unsigned FIFOIP26:1;
    unsigned FIFOIP27:1;
    unsigned FIFOIP28:1;
    unsigned FIFOIP29:1;
    unsigned FIFOIP30:1;
    unsigned FIFOIP31:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FSTATbits_t;
extern volatile __C1FSTATbits_t C1FSTATbits __asm__ ("C1FSTAT") __attribute__((section("sfrs")));
extern volatile unsigned int C1FSTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FSTATSET __attribute__((section("sfrs")));
extern volatile unsigned int C1FSTATINV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXOVF __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXOVF0:1;
    unsigned RXOVF1:1;
    unsigned RXOVF2:1;
    unsigned RXOVF3:1;
    unsigned RXOVF4:1;
    unsigned RXOVF5:1;
    unsigned RXOVF6:1;
    unsigned RXOVF7:1;
    unsigned RXOVF8:1;
    unsigned RXOVF9:1;
    unsigned RXOVF10:1;
    unsigned RXOVF11:1;
    unsigned RXOVF12:1;
    unsigned RXOVF13:1;
    unsigned RXOVF14:1;
    unsigned RXOVF15:1;
    unsigned RXOVF16:1;
    unsigned RXOVF17:1;
    unsigned RXOVF18:1;
    unsigned RXOVF19:1;
    unsigned RXOVF20:1;
    unsigned RXOVF21:1;
    unsigned RXOVF22:1;
    unsigned RXOVF23:1;
    unsigned RXOVF24:1;
    unsigned RXOVF25:1;
    unsigned RXOVF26:1;
    unsigned RXOVF27:1;
    unsigned RXOVF28:1;
    unsigned RXOVF29:1;
    unsigned RXOVF30:1;
    unsigned RXOVF31:1;
  };
  struct {
    unsigned w:32;
  };
} __C1RXOVFbits_t;
extern volatile __C1RXOVFbits_t C1RXOVFbits __asm__ ("C1RXOVF") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXOVFCLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXOVFSET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXOVFINV __attribute__((section("sfrs")));
extern volatile unsigned int C1TMR __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CANTSPRE:16;
    unsigned CANTS:16;
  };
  struct {
    unsigned w:32;
  };
} __C1TMRbits_t;
extern volatile __C1TMRbits_t C1TMRbits __asm__ ("C1TMR") __attribute__((section("sfrs")));
extern volatile unsigned int C1TMRCLR __attribute__((section("sfrs")));
extern volatile unsigned int C1TMRSET __attribute__((section("sfrs")));
extern volatile unsigned int C1TMRINV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned MIDE:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXM0bits_t;
extern volatile __C1RXM0bits_t C1RXM0bits __asm__ ("C1RXM0") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM0SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM0INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned MIDE:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXM1bits_t;
extern volatile __C1RXM1bits_t C1RXM1bits __asm__ ("C1RXM1") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM1SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM1INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned MIDE:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXM2bits_t;
extern volatile __C1RXM2bits_t C1RXM2bits __asm__ ("C1RXM2") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM2SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM2INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned MIDE:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXM3bits_t;
extern volatile __C1RXM3bits_t C1RXM3bits __asm__ ("C1RXM3") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM3SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXM3INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL0:5;
    unsigned MSEL0:2;
    unsigned FLTEN0:1;
    unsigned FSEL1:5;
    unsigned MSEL1:2;
    unsigned FLTEN1:1;
    unsigned FSEL2:5;
    unsigned MSEL2:2;
    unsigned FLTEN2:1;
    unsigned FSEL3:5;
    unsigned MSEL3:2;
    unsigned FLTEN3:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FLTCON0bits_t;
extern volatile __C1FLTCON0bits_t C1FLTCON0bits __asm__ ("C1FLTCON0") __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON0SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON0INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL4:5;
    unsigned MSEL4:2;
    unsigned FLTEN4:1;
    unsigned FSEL5:5;
    unsigned MSEL5:2;
    unsigned FLTEN5:1;
    unsigned FSEL6:5;
    unsigned MSEL6:2;
    unsigned FLTEN6:1;
    unsigned FSEL7:5;
    unsigned MSEL7:2;
    unsigned FLTEN7:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FLTCON1bits_t;
extern volatile __C1FLTCON1bits_t C1FLTCON1bits __asm__ ("C1FLTCON1") __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON1SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON1INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL8:5;
    unsigned MSEL8:2;
    unsigned FLTEN8:1;
    unsigned FSEL9:5;
    unsigned MSEL9:2;
    unsigned FLTEN9:1;
    unsigned FSEL10:5;
    unsigned MSEL10:2;
    unsigned FLTEN10:1;
    unsigned FSEL11:5;
    unsigned MSEL11:2;
    unsigned FLTEN11:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FLTCON2bits_t;
extern volatile __C1FLTCON2bits_t C1FLTCON2bits __asm__ ("C1FLTCON2") __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON2SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON2INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL12:5;
    unsigned MSEL12:2;
    unsigned FLTEN12:1;
    unsigned FSEL13:5;
    unsigned MSEL13:2;
    unsigned FLTEN13:1;
    unsigned FSEL14:5;
    unsigned MSEL14:2;
    unsigned FLTEN14:1;
    unsigned FSEL15:5;
    unsigned MSEL15:2;
    unsigned FLTEN15:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FLTCON3bits_t;
extern volatile __C1FLTCON3bits_t C1FLTCON3bits __asm__ ("C1FLTCON3") __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON3SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON3INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON4 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL16:5;
    unsigned MSEL16:2;
    unsigned FLTEN16:1;
    unsigned FSEL17:5;
    unsigned MSEL17:2;
    unsigned FLTEN17:1;
    unsigned FSEL18:5;
    unsigned MSEL18:2;
    unsigned FLTEN18:1;
    unsigned FSEL19:5;
    unsigned MSEL19:2;
    unsigned FLTEN19:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FLTCON4bits_t;
extern volatile __C1FLTCON4bits_t C1FLTCON4bits __asm__ ("C1FLTCON4") __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON4CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON4SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON4INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON5 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL20:5;
    unsigned MSEL20:2;
    unsigned FLTEN20:1;
    unsigned FSEL21:5;
    unsigned MSEL21:2;
    unsigned FLTEN21:1;
    unsigned FSEL22:5;
    unsigned MSEL22:2;
    unsigned FLTEN22:1;
    unsigned FSEL23:5;
    unsigned MSEL23:2;
    unsigned FLTEN23:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FLTCON5bits_t;
extern volatile __C1FLTCON5bits_t C1FLTCON5bits __asm__ ("C1FLTCON5") __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON5CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON5SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON5INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON6 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL24:5;
    unsigned MSEL24:2;
    unsigned FLTEN24:1;
    unsigned FSEL25:5;
    unsigned MSEL25:2;
    unsigned FLTEN25:1;
    unsigned FSEL26:5;
    unsigned MSEL26:2;
    unsigned FLTEN26:1;
    unsigned FSEL27:5;
    unsigned MSEL27:2;
    unsigned FLTEN27:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FLTCON6bits_t;
extern volatile __C1FLTCON6bits_t C1FLTCON6bits __asm__ ("C1FLTCON6") __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON6CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON6SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON6INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON7 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL28:5;
    unsigned MSEL28:2;
    unsigned FLTEN28:1;
    unsigned FSEL29:5;
    unsigned MSEL29:2;
    unsigned FLTEN29:1;
    unsigned FSEL30:5;
    unsigned MSEL30:2;
    unsigned FLTEN30:1;
    unsigned FSEL31:5;
    unsigned MSEL31:2;
    unsigned FLTEN31:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FLTCON7bits_t;
extern volatile __C1FLTCON7bits_t C1FLTCON7bits __asm__ ("C1FLTCON7") __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON7CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON7SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FLTCON7INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF0bits_t;
extern volatile __C1RXF0bits_t C1RXF0bits __asm__ ("C1RXF0") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF0SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF0INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF1bits_t;
extern volatile __C1RXF1bits_t C1RXF1bits __asm__ ("C1RXF1") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF1SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF1INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF2bits_t;
extern volatile __C1RXF2bits_t C1RXF2bits __asm__ ("C1RXF2") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF2SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF2INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF3bits_t;
extern volatile __C1RXF3bits_t C1RXF3bits __asm__ ("C1RXF3") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF3SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF3INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF4 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF4bits_t;
extern volatile __C1RXF4bits_t C1RXF4bits __asm__ ("C1RXF4") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF4CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF4SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF4INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF5 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF5bits_t;
extern volatile __C1RXF5bits_t C1RXF5bits __asm__ ("C1RXF5") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF5CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF5SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF5INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF6 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF6bits_t;
extern volatile __C1RXF6bits_t C1RXF6bits __asm__ ("C1RXF6") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF6CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF6SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF6INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF7 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF7bits_t;
extern volatile __C1RXF7bits_t C1RXF7bits __asm__ ("C1RXF7") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF7CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF7SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF7INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF8 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF8bits_t;
extern volatile __C1RXF8bits_t C1RXF8bits __asm__ ("C1RXF8") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF8CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF8SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF8INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF9 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF9bits_t;
extern volatile __C1RXF9bits_t C1RXF9bits __asm__ ("C1RXF9") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF9CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF9SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF9INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF10 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF10bits_t;
extern volatile __C1RXF10bits_t C1RXF10bits __asm__ ("C1RXF10") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF10CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF10SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF10INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF11 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF11bits_t;
extern volatile __C1RXF11bits_t C1RXF11bits __asm__ ("C1RXF11") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF11CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF11SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF11INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF12 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF12bits_t;
extern volatile __C1RXF12bits_t C1RXF12bits __asm__ ("C1RXF12") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF12CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF12SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF12INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF13 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF13bits_t;
extern volatile __C1RXF13bits_t C1RXF13bits __asm__ ("C1RXF13") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF13CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF13SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF13INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF14 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF14bits_t;
extern volatile __C1RXF14bits_t C1RXF14bits __asm__ ("C1RXF14") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF14CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF14SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF14INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF15 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF15bits_t;
extern volatile __C1RXF15bits_t C1RXF15bits __asm__ ("C1RXF15") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF15CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF15SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF15INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF16 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF16bits_t;
extern volatile __C1RXF16bits_t C1RXF16bits __asm__ ("C1RXF16") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF16CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF16SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF16INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF17 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF17bits_t;
extern volatile __C1RXF17bits_t C1RXF17bits __asm__ ("C1RXF17") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF17CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF17SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF17INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF18 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF18bits_t;
extern volatile __C1RXF18bits_t C1RXF18bits __asm__ ("C1RXF18") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF18CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF18SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF18INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF19 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF19bits_t;
extern volatile __C1RXF19bits_t C1RXF19bits __asm__ ("C1RXF19") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF19CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF19SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF19INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF20 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF20bits_t;
extern volatile __C1RXF20bits_t C1RXF20bits __asm__ ("C1RXF20") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF20CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF20SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF20INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF21 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF21bits_t;
extern volatile __C1RXF21bits_t C1RXF21bits __asm__ ("C1RXF21") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF21CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF21SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF21INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF22 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF22bits_t;
extern volatile __C1RXF22bits_t C1RXF22bits __asm__ ("C1RXF22") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF22CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF22SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF22INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF23 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF23bits_t;
extern volatile __C1RXF23bits_t C1RXF23bits __asm__ ("C1RXF23") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF23CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF23SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF23INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF24 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF24bits_t;
extern volatile __C1RXF24bits_t C1RXF24bits __asm__ ("C1RXF24") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF24CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF24SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF24INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF25 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF25bits_t;
extern volatile __C1RXF25bits_t C1RXF25bits __asm__ ("C1RXF25") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF25CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF25SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF25INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF26 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF26bits_t;
extern volatile __C1RXF26bits_t C1RXF26bits __asm__ ("C1RXF26") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF26CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF26SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF26INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF27 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF27bits_t;
extern volatile __C1RXF27bits_t C1RXF27bits __asm__ ("C1RXF27") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF27CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF27SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF27INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF28 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF28bits_t;
extern volatile __C1RXF28bits_t C1RXF28bits __asm__ ("C1RXF28") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF28CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF28SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF28INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF29 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF29bits_t;
extern volatile __C1RXF29bits_t C1RXF29bits __asm__ ("C1RXF29") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF29CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF29SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF29INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF30 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF30bits_t;
extern volatile __C1RXF30bits_t C1RXF30bits __asm__ ("C1RXF30") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF30CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF30SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF30INV __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF31 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C1RXF31bits_t;
extern volatile __C1RXF31bits_t C1RXF31bits __asm__ ("C1RXF31") __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF31CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF31SET __attribute__((section("sfrs")));
extern volatile unsigned int C1RXF31INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOBA __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOBACLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOBASET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOBAINV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON0bits_t;
extern volatile __C1FIFOCON0bits_t C1FIFOCON0bits __asm__ ("C1FIFOCON0") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON0SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON0INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT0bits_t;
extern volatile __C1FIFOINT0bits_t C1FIFOINT0bits __asm__ ("C1FIFOINT0") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT0SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT0INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA0 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA0SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA0INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI0bits_t;
extern volatile __C1FIFOCI0bits_t C1FIFOCI0bits __asm__ ("C1FIFOCI0") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI0SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI0INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON1bits_t;
extern volatile __C1FIFOCON1bits_t C1FIFOCON1bits __asm__ ("C1FIFOCON1") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON1SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON1INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT1bits_t;
extern volatile __C1FIFOINT1bits_t C1FIFOINT1bits __asm__ ("C1FIFOINT1") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT1SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT1INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA1 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA1SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA1INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI1bits_t;
extern volatile __C1FIFOCI1bits_t C1FIFOCI1bits __asm__ ("C1FIFOCI1") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI1SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI1INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON2bits_t;
extern volatile __C1FIFOCON2bits_t C1FIFOCON2bits __asm__ ("C1FIFOCON2") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON2SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON2INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT2bits_t;
extern volatile __C1FIFOINT2bits_t C1FIFOINT2bits __asm__ ("C1FIFOINT2") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT2SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT2INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA2 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA2SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA2INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI2bits_t;
extern volatile __C1FIFOCI2bits_t C1FIFOCI2bits __asm__ ("C1FIFOCI2") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI2SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI2INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON3bits_t;
extern volatile __C1FIFOCON3bits_t C1FIFOCON3bits __asm__ ("C1FIFOCON3") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON3SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON3INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT3bits_t;
extern volatile __C1FIFOINT3bits_t C1FIFOINT3bits __asm__ ("C1FIFOINT3") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT3SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT3INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA3 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA3SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA3INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI3bits_t;
extern volatile __C1FIFOCI3bits_t C1FIFOCI3bits __asm__ ("C1FIFOCI3") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI3SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI3INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON4 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON4bits_t;
extern volatile __C1FIFOCON4bits_t C1FIFOCON4bits __asm__ ("C1FIFOCON4") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON4CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON4SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON4INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT4 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT4bits_t;
extern volatile __C1FIFOINT4bits_t C1FIFOINT4bits __asm__ ("C1FIFOINT4") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT4CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT4SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT4INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA4 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA4CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA4SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA4INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI4 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI4bits_t;
extern volatile __C1FIFOCI4bits_t C1FIFOCI4bits __asm__ ("C1FIFOCI4") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI4CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI4SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI4INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON5 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON5bits_t;
extern volatile __C1FIFOCON5bits_t C1FIFOCON5bits __asm__ ("C1FIFOCON5") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON5CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON5SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON5INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT5 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT5bits_t;
extern volatile __C1FIFOINT5bits_t C1FIFOINT5bits __asm__ ("C1FIFOINT5") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT5CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT5SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT5INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA5 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA5CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA5SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA5INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI5 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI5bits_t;
extern volatile __C1FIFOCI5bits_t C1FIFOCI5bits __asm__ ("C1FIFOCI5") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI5CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI5SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI5INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON6 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON6bits_t;
extern volatile __C1FIFOCON6bits_t C1FIFOCON6bits __asm__ ("C1FIFOCON6") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON6CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON6SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON6INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT6 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT6bits_t;
extern volatile __C1FIFOINT6bits_t C1FIFOINT6bits __asm__ ("C1FIFOINT6") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT6CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT6SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT6INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA6 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA6CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA6SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA6INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI6 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI6bits_t;
extern volatile __C1FIFOCI6bits_t C1FIFOCI6bits __asm__ ("C1FIFOCI6") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI6CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI6SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI6INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON7 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON7bits_t;
extern volatile __C1FIFOCON7bits_t C1FIFOCON7bits __asm__ ("C1FIFOCON7") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON7CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON7SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON7INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT7 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT7bits_t;
extern volatile __C1FIFOINT7bits_t C1FIFOINT7bits __asm__ ("C1FIFOINT7") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT7CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT7SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT7INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA7 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA7CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA7SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA7INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI7 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI7bits_t;
extern volatile __C1FIFOCI7bits_t C1FIFOCI7bits __asm__ ("C1FIFOCI7") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI7CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI7SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI7INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON8 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON8bits_t;
extern volatile __C1FIFOCON8bits_t C1FIFOCON8bits __asm__ ("C1FIFOCON8") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON8CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON8SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON8INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT8 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT8bits_t;
extern volatile __C1FIFOINT8bits_t C1FIFOINT8bits __asm__ ("C1FIFOINT8") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT8CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT8SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT8INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA8 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA8CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA8SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA8INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI8 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI8bits_t;
extern volatile __C1FIFOCI8bits_t C1FIFOCI8bits __asm__ ("C1FIFOCI8") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI8CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI8SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI8INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON9 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON9bits_t;
extern volatile __C1FIFOCON9bits_t C1FIFOCON9bits __asm__ ("C1FIFOCON9") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON9CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON9SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON9INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT9 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT9bits_t;
extern volatile __C1FIFOINT9bits_t C1FIFOINT9bits __asm__ ("C1FIFOINT9") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT9CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT9SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT9INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA9 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA9CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA9SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA9INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI9 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI9bits_t;
extern volatile __C1FIFOCI9bits_t C1FIFOCI9bits __asm__ ("C1FIFOCI9") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI9CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI9SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI9INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON10 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON10bits_t;
extern volatile __C1FIFOCON10bits_t C1FIFOCON10bits __asm__ ("C1FIFOCON10") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON10CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON10SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON10INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT10 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT10bits_t;
extern volatile __C1FIFOINT10bits_t C1FIFOINT10bits __asm__ ("C1FIFOINT10") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT10CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT10SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT10INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA10 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA10CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA10SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA10INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI10 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI10bits_t;
extern volatile __C1FIFOCI10bits_t C1FIFOCI10bits __asm__ ("C1FIFOCI10") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI10CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI10SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI10INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON11 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON11bits_t;
extern volatile __C1FIFOCON11bits_t C1FIFOCON11bits __asm__ ("C1FIFOCON11") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON11CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON11SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON11INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT11 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT11bits_t;
extern volatile __C1FIFOINT11bits_t C1FIFOINT11bits __asm__ ("C1FIFOINT11") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT11CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT11SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT11INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA11 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA11CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA11SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA11INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI11 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI11bits_t;
extern volatile __C1FIFOCI11bits_t C1FIFOCI11bits __asm__ ("C1FIFOCI11") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI11CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI11SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI11INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON12 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON12bits_t;
extern volatile __C1FIFOCON12bits_t C1FIFOCON12bits __asm__ ("C1FIFOCON12") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON12CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON12SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON12INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT12 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT12bits_t;
extern volatile __C1FIFOINT12bits_t C1FIFOINT12bits __asm__ ("C1FIFOINT12") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT12CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT12SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT12INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA12 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA12CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA12SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA12INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI12 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI12bits_t;
extern volatile __C1FIFOCI12bits_t C1FIFOCI12bits __asm__ ("C1FIFOCI12") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI12CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI12SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI12INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON13 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON13bits_t;
extern volatile __C1FIFOCON13bits_t C1FIFOCON13bits __asm__ ("C1FIFOCON13") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON13CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON13SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON13INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT13 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT13bits_t;
extern volatile __C1FIFOINT13bits_t C1FIFOINT13bits __asm__ ("C1FIFOINT13") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT13CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT13SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT13INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA13 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA13CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA13SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA13INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI13 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI13bits_t;
extern volatile __C1FIFOCI13bits_t C1FIFOCI13bits __asm__ ("C1FIFOCI13") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI13CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI13SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI13INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON14 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON14bits_t;
extern volatile __C1FIFOCON14bits_t C1FIFOCON14bits __asm__ ("C1FIFOCON14") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON14CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON14SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON14INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT14 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT14bits_t;
extern volatile __C1FIFOINT14bits_t C1FIFOINT14bits __asm__ ("C1FIFOINT14") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT14CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT14SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT14INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA14 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA14CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA14SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA14INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI14 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI14bits_t;
extern volatile __C1FIFOCI14bits_t C1FIFOCI14bits __asm__ ("C1FIFOCI14") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI14CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI14SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI14INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON15 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON15bits_t;
extern volatile __C1FIFOCON15bits_t C1FIFOCON15bits __asm__ ("C1FIFOCON15") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON15CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON15SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON15INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT15 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT15bits_t;
extern volatile __C1FIFOINT15bits_t C1FIFOINT15bits __asm__ ("C1FIFOINT15") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT15CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT15SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT15INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA15 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA15CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA15SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA15INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI15 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI15bits_t;
extern volatile __C1FIFOCI15bits_t C1FIFOCI15bits __asm__ ("C1FIFOCI15") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI15CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI15SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI15INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON16 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON16bits_t;
extern volatile __C1FIFOCON16bits_t C1FIFOCON16bits __asm__ ("C1FIFOCON16") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON16CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON16SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON16INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT16 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT16bits_t;
extern volatile __C1FIFOINT16bits_t C1FIFOINT16bits __asm__ ("C1FIFOINT16") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT16CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT16SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT16INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA16 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA16CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA16SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA16INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI16 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI16bits_t;
extern volatile __C1FIFOCI16bits_t C1FIFOCI16bits __asm__ ("C1FIFOCI16") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI16CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI16SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI16INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON17 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON17bits_t;
extern volatile __C1FIFOCON17bits_t C1FIFOCON17bits __asm__ ("C1FIFOCON17") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON17CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON17SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON17INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT17 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT17bits_t;
extern volatile __C1FIFOINT17bits_t C1FIFOINT17bits __asm__ ("C1FIFOINT17") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT17CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT17SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT17INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA17 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA17CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA17SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA17INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI17 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI17bits_t;
extern volatile __C1FIFOCI17bits_t C1FIFOCI17bits __asm__ ("C1FIFOCI17") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI17CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI17SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI17INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON18 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON18bits_t;
extern volatile __C1FIFOCON18bits_t C1FIFOCON18bits __asm__ ("C1FIFOCON18") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON18CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON18SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON18INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT18 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT18bits_t;
extern volatile __C1FIFOINT18bits_t C1FIFOINT18bits __asm__ ("C1FIFOINT18") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT18CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT18SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT18INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA18 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA18CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA18SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA18INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI18 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI18bits_t;
extern volatile __C1FIFOCI18bits_t C1FIFOCI18bits __asm__ ("C1FIFOCI18") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI18CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI18SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI18INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON19 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON19bits_t;
extern volatile __C1FIFOCON19bits_t C1FIFOCON19bits __asm__ ("C1FIFOCON19") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON19CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON19SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON19INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT19 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT19bits_t;
extern volatile __C1FIFOINT19bits_t C1FIFOINT19bits __asm__ ("C1FIFOINT19") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT19CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT19SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT19INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA19 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA19CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA19SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA19INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI19 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI19bits_t;
extern volatile __C1FIFOCI19bits_t C1FIFOCI19bits __asm__ ("C1FIFOCI19") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI19CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI19SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI19INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON20 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON20bits_t;
extern volatile __C1FIFOCON20bits_t C1FIFOCON20bits __asm__ ("C1FIFOCON20") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON20CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON20SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON20INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT20 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT20bits_t;
extern volatile __C1FIFOINT20bits_t C1FIFOINT20bits __asm__ ("C1FIFOINT20") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT20CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT20SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT20INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA20 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA20CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA20SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA20INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI20 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI20bits_t;
extern volatile __C1FIFOCI20bits_t C1FIFOCI20bits __asm__ ("C1FIFOCI20") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI20CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI20SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI20INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON21 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON21bits_t;
extern volatile __C1FIFOCON21bits_t C1FIFOCON21bits __asm__ ("C1FIFOCON21") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON21CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON21SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON21INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT21 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT21bits_t;
extern volatile __C1FIFOINT21bits_t C1FIFOINT21bits __asm__ ("C1FIFOINT21") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT21CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT21SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT21INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA21 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA21CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA21SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA21INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI21 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI21bits_t;
extern volatile __C1FIFOCI21bits_t C1FIFOCI21bits __asm__ ("C1FIFOCI21") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI21CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI21SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI21INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON22 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON22bits_t;
extern volatile __C1FIFOCON22bits_t C1FIFOCON22bits __asm__ ("C1FIFOCON22") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON22CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON22SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON22INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT22 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT22bits_t;
extern volatile __C1FIFOINT22bits_t C1FIFOINT22bits __asm__ ("C1FIFOINT22") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT22CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT22SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT22INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA22 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA22CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA22SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA22INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI22 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI22bits_t;
extern volatile __C1FIFOCI22bits_t C1FIFOCI22bits __asm__ ("C1FIFOCI22") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI22CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI22SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI22INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON23 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON23bits_t;
extern volatile __C1FIFOCON23bits_t C1FIFOCON23bits __asm__ ("C1FIFOCON23") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON23CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON23SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON23INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT23 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT23bits_t;
extern volatile __C1FIFOINT23bits_t C1FIFOINT23bits __asm__ ("C1FIFOINT23") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT23CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT23SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT23INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA23 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA23CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA23SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA23INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI23 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI23bits_t;
extern volatile __C1FIFOCI23bits_t C1FIFOCI23bits __asm__ ("C1FIFOCI23") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI23CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI23SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI23INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON24 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON24bits_t;
extern volatile __C1FIFOCON24bits_t C1FIFOCON24bits __asm__ ("C1FIFOCON24") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON24CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON24SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON24INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT24 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT24bits_t;
extern volatile __C1FIFOINT24bits_t C1FIFOINT24bits __asm__ ("C1FIFOINT24") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT24CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT24SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT24INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA24 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA24CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA24SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA24INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI24 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI24bits_t;
extern volatile __C1FIFOCI24bits_t C1FIFOCI24bits __asm__ ("C1FIFOCI24") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI24CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI24SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI24INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON25 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON25bits_t;
extern volatile __C1FIFOCON25bits_t C1FIFOCON25bits __asm__ ("C1FIFOCON25") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON25CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON25SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON25INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT25 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT25bits_t;
extern volatile __C1FIFOINT25bits_t C1FIFOINT25bits __asm__ ("C1FIFOINT25") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT25CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT25SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT25INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA25 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA25CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA25SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA25INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI25 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI25bits_t;
extern volatile __C1FIFOCI25bits_t C1FIFOCI25bits __asm__ ("C1FIFOCI25") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI25CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI25SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI25INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON26 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON26bits_t;
extern volatile __C1FIFOCON26bits_t C1FIFOCON26bits __asm__ ("C1FIFOCON26") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON26CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON26SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON26INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT26 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT26bits_t;
extern volatile __C1FIFOINT26bits_t C1FIFOINT26bits __asm__ ("C1FIFOINT26") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT26CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT26SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT26INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA26 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA26CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA26SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA26INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI26 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI26bits_t;
extern volatile __C1FIFOCI26bits_t C1FIFOCI26bits __asm__ ("C1FIFOCI26") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI26CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI26SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI26INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON27 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON27bits_t;
extern volatile __C1FIFOCON27bits_t C1FIFOCON27bits __asm__ ("C1FIFOCON27") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON27CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON27SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON27INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT27 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT27bits_t;
extern volatile __C1FIFOINT27bits_t C1FIFOINT27bits __asm__ ("C1FIFOINT27") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT27CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT27SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT27INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA27 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA27CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA27SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA27INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI27 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI27bits_t;
extern volatile __C1FIFOCI27bits_t C1FIFOCI27bits __asm__ ("C1FIFOCI27") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI27CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI27SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI27INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON28 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON28bits_t;
extern volatile __C1FIFOCON28bits_t C1FIFOCON28bits __asm__ ("C1FIFOCON28") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON28CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON28SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON28INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT28 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT28bits_t;
extern volatile __C1FIFOINT28bits_t C1FIFOINT28bits __asm__ ("C1FIFOINT28") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT28CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT28SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT28INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA28 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA28CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA28SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA28INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI28 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI28bits_t;
extern volatile __C1FIFOCI28bits_t C1FIFOCI28bits __asm__ ("C1FIFOCI28") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI28CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI28SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI28INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON29 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON29bits_t;
extern volatile __C1FIFOCON29bits_t C1FIFOCON29bits __asm__ ("C1FIFOCON29") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON29CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON29SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON29INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT29 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT29bits_t;
extern volatile __C1FIFOINT29bits_t C1FIFOINT29bits __asm__ ("C1FIFOINT29") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT29CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT29SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT29INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA29 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA29CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA29SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA29INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI29 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI29bits_t;
extern volatile __C1FIFOCI29bits_t C1FIFOCI29bits __asm__ ("C1FIFOCI29") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI29CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI29SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI29INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON30 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON30bits_t;
extern volatile __C1FIFOCON30bits_t C1FIFOCON30bits __asm__ ("C1FIFOCON30") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON30CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON30SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON30INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT30 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT30bits_t;
extern volatile __C1FIFOINT30bits_t C1FIFOINT30bits __asm__ ("C1FIFOINT30") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT30CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT30SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT30INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA30 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA30CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA30SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA30INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI30 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI30bits_t;
extern volatile __C1FIFOCI30bits_t C1FIFOCI30bits __asm__ ("C1FIFOCI30") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI30CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI30SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI30INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON31 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCON31bits_t;
extern volatile __C1FIFOCON31bits_t C1FIFOCON31bits __asm__ ("C1FIFOCON31") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON31CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON31SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCON31INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT31 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOINT31bits_t;
extern volatile __C1FIFOINT31bits_t C1FIFOINT31bits __asm__ ("C1FIFOINT31") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT31CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT31SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOINT31INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA31 __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA31CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA31SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOUA31INV __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI31 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C1FIFOCI31bits_t;
extern volatile __C1FIFOCI31bits_t C1FIFOCI31bits __asm__ ("C1FIFOCI31") __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI31CLR __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI31SET __attribute__((section("sfrs")));
extern volatile unsigned int C1FIFOCI31INV __attribute__((section("sfrs")));
extern volatile unsigned int C2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned DNCNT:5;
    unsigned :6;
    unsigned CANBUSY:1;
    unsigned :1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned :4;
    unsigned CANCAP:1;
    unsigned OPMOD:3;
    unsigned REQOP:3;
    unsigned ABAT:1;
  };
  struct {
    unsigned w:32;
  };
} __C2CONbits_t;
extern volatile __C2CONbits_t C2CONbits __asm__ ("C2CON") __attribute__((section("sfrs")));
extern volatile unsigned int C2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int C2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int C2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int C2CFG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned BRP:6;
    unsigned SJW:2;
    unsigned PRSEG:3;
    unsigned SEG1PH:3;
    unsigned SAM:1;
    unsigned SEG2PHTS:1;
    unsigned SEG2PH:3;
    unsigned :3;
    unsigned WAKFIL:1;
  };
  struct {
    unsigned w:32;
  };
} __C2CFGbits_t;
extern volatile __C2CFGbits_t C2CFGbits __asm__ ("C2CFG") __attribute__((section("sfrs")));
extern volatile unsigned int C2CFGCLR __attribute__((section("sfrs")));
extern volatile unsigned int C2CFGSET __attribute__((section("sfrs")));
extern volatile unsigned int C2CFGINV __attribute__((section("sfrs")));
extern volatile unsigned int C2INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TBIF:1;
    unsigned RBIF:1;
    unsigned CTMRIF:1;
    unsigned MODIF:1;
    unsigned :7;
    unsigned RBOVIF:1;
    unsigned SERRIF:1;
    unsigned CERRIF:1;
    unsigned WAKIF:1;
    unsigned IVRIF:1;
    unsigned TBIE:1;
    unsigned RBIE:1;
    unsigned CTMRIE:1;
    unsigned MODIE:1;
    unsigned :7;
    unsigned RBOVIE:1;
    unsigned SERRIE:1;
    unsigned CERRIE:1;
    unsigned WAKIE:1;
    unsigned IVRIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2INTbits_t;
extern volatile __C2INTbits_t C2INTbits __asm__ ("C2INT") __attribute__((section("sfrs")));
extern volatile unsigned int C2INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int C2INTSET __attribute__((section("sfrs")));
extern volatile unsigned int C2INTINV __attribute__((section("sfrs")));
extern volatile unsigned int C2VEC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ICODE:7;
    unsigned :1;
    unsigned FILHIT:5;
  };
  struct {
    unsigned w:32;
  };
} __C2VECbits_t;
extern volatile __C2VECbits_t C2VECbits __asm__ ("C2VEC") __attribute__((section("sfrs")));
extern volatile unsigned int C2VECCLR __attribute__((section("sfrs")));
extern volatile unsigned int C2VECSET __attribute__((section("sfrs")));
extern volatile unsigned int C2VECINV __attribute__((section("sfrs")));
extern volatile unsigned int C2TREC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RERRCNT:8;
    unsigned TERRCNT:8;
    unsigned EWARN:1;
    unsigned RXWARN:1;
    unsigned TXWARN:1;
    unsigned RXBP:1;
    unsigned TXBP:1;
    unsigned TXBO:1;
  };
  struct {
    unsigned w:32;
  };
} __C2TRECbits_t;
extern volatile __C2TRECbits_t C2TRECbits __asm__ ("C2TREC") __attribute__((section("sfrs")));
extern volatile unsigned int C2TRECCLR __attribute__((section("sfrs")));
extern volatile unsigned int C2TRECSET __attribute__((section("sfrs")));
extern volatile unsigned int C2TRECINV __attribute__((section("sfrs")));
extern volatile unsigned int C2FSTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FIFOIP0:1;
    unsigned FIFOIP1:1;
    unsigned FIFOIP2:1;
    unsigned FIFOIP3:1;
    unsigned FIFOIP4:1;
    unsigned FIFOIP5:1;
    unsigned FIFOIP6:1;
    unsigned FIFOIP7:1;
    unsigned FIFOIP8:1;
    unsigned FIFOIP9:1;
    unsigned FIFOIP10:1;
    unsigned FIFOIP11:1;
    unsigned FIFOIP12:1;
    unsigned FIFOIP13:1;
    unsigned FIFOIP14:1;
    unsigned FIFOIP15:1;
    unsigned FIFOIP16:1;
    unsigned FIFOIP17:1;
    unsigned FIFOIP18:1;
    unsigned FIFOIP19:1;
    unsigned FIFOIP20:1;
    unsigned FIFOIP21:1;
    unsigned FIFOIP22:1;
    unsigned FIFOIP23:1;
    unsigned FIFOIP24:1;
    unsigned FIFOIP25:1;
    unsigned FIFOIP26:1;
    unsigned FIFOIP27:1;
    unsigned FIFOIP28:1;
    unsigned FIFOIP29:1;
    unsigned FIFOIP30:1;
    unsigned FIFOIP31:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FSTATbits_t;
extern volatile __C2FSTATbits_t C2FSTATbits __asm__ ("C2FSTAT") __attribute__((section("sfrs")));
extern volatile unsigned int C2FSTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FSTATSET __attribute__((section("sfrs")));
extern volatile unsigned int C2FSTATINV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXOVF __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXOVF0:1;
    unsigned RXOVF1:1;
    unsigned RXOVF2:1;
    unsigned RXOVF3:1;
    unsigned RXOVF4:1;
    unsigned RXOVF5:1;
    unsigned RXOVF6:1;
    unsigned RXOVF7:1;
    unsigned RXOVF8:1;
    unsigned RXOVF9:1;
    unsigned RXOVF10:1;
    unsigned RXOVF11:1;
    unsigned RXOVF12:1;
    unsigned RXOVF13:1;
    unsigned RXOVF14:1;
    unsigned RXOVF15:1;
    unsigned RXOVF16:1;
    unsigned RXOVF17:1;
    unsigned RXOVF18:1;
    unsigned RXOVF19:1;
    unsigned RXOVF20:1;
    unsigned RXOVF21:1;
    unsigned RXOVF22:1;
    unsigned RXOVF23:1;
    unsigned RXOVF24:1;
    unsigned RXOVF25:1;
    unsigned RXOVF26:1;
    unsigned RXOVF27:1;
    unsigned RXOVF28:1;
    unsigned RXOVF29:1;
    unsigned RXOVF30:1;
    unsigned RXOVF31:1;
  };
  struct {
    unsigned w:32;
  };
} __C2RXOVFbits_t;
extern volatile __C2RXOVFbits_t C2RXOVFbits __asm__ ("C2RXOVF") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXOVFCLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXOVFSET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXOVFINV __attribute__((section("sfrs")));
extern volatile unsigned int C2TMR __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CANTSPRE:16;
    unsigned CANTS:16;
  };
  struct {
    unsigned w:32;
  };
} __C2TMRbits_t;
extern volatile __C2TMRbits_t C2TMRbits __asm__ ("C2TMR") __attribute__((section("sfrs")));
extern volatile unsigned int C2TMRCLR __attribute__((section("sfrs")));
extern volatile unsigned int C2TMRSET __attribute__((section("sfrs")));
extern volatile unsigned int C2TMRINV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned MIDE:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXM0bits_t;
extern volatile __C2RXM0bits_t C2RXM0bits __asm__ ("C2RXM0") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM0SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM0INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned MIDE:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXM1bits_t;
extern volatile __C2RXM1bits_t C2RXM1bits __asm__ ("C2RXM1") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM1SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM1INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned MIDE:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXM2bits_t;
extern volatile __C2RXM2bits_t C2RXM2bits __asm__ ("C2RXM2") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM2SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM2INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned MIDE:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXM3bits_t;
extern volatile __C2RXM3bits_t C2RXM3bits __asm__ ("C2RXM3") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM3SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXM3INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL0:5;
    unsigned MSEL0:2;
    unsigned FLTEN0:1;
    unsigned FSEL1:5;
    unsigned MSEL1:2;
    unsigned FLTEN1:1;
    unsigned FSEL2:5;
    unsigned MSEL2:2;
    unsigned FLTEN2:1;
    unsigned FSEL3:5;
    unsigned MSEL3:2;
    unsigned FLTEN3:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FLTCON0bits_t;
extern volatile __C2FLTCON0bits_t C2FLTCON0bits __asm__ ("C2FLTCON0") __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON0SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON0INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL4:5;
    unsigned MSEL4:2;
    unsigned FLTEN4:1;
    unsigned FSEL5:5;
    unsigned MSEL5:2;
    unsigned FLTEN5:1;
    unsigned FSEL6:5;
    unsigned MSEL6:2;
    unsigned FLTEN6:1;
    unsigned FSEL7:5;
    unsigned MSEL7:2;
    unsigned FLTEN7:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FLTCON1bits_t;
extern volatile __C2FLTCON1bits_t C2FLTCON1bits __asm__ ("C2FLTCON1") __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON1SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON1INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL8:5;
    unsigned MSEL8:2;
    unsigned FLTEN8:1;
    unsigned FSEL9:5;
    unsigned MSEL9:2;
    unsigned FLTEN9:1;
    unsigned FSEL10:5;
    unsigned MSEL10:2;
    unsigned FLTEN10:1;
    unsigned FSEL11:5;
    unsigned MSEL11:2;
    unsigned FLTEN11:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FLTCON2bits_t;
extern volatile __C2FLTCON2bits_t C2FLTCON2bits __asm__ ("C2FLTCON2") __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON2SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON2INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL12:5;
    unsigned MSEL12:2;
    unsigned FLTEN12:1;
    unsigned FSEL13:5;
    unsigned MSEL13:2;
    unsigned FLTEN13:1;
    unsigned FSEL14:5;
    unsigned MSEL14:2;
    unsigned FLTEN14:1;
    unsigned FSEL15:5;
    unsigned MSEL15:2;
    unsigned FLTEN15:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FLTCON3bits_t;
extern volatile __C2FLTCON3bits_t C2FLTCON3bits __asm__ ("C2FLTCON3") __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON3SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON3INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON4 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL16:5;
    unsigned MSEL16:2;
    unsigned FLTEN16:1;
    unsigned FSEL17:5;
    unsigned MSEL17:2;
    unsigned FLTEN17:1;
    unsigned FSEL18:5;
    unsigned MSEL18:2;
    unsigned FLTEN18:1;
    unsigned FSEL19:5;
    unsigned MSEL19:2;
    unsigned FLTEN19:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FLTCON4bits_t;
extern volatile __C2FLTCON4bits_t C2FLTCON4bits __asm__ ("C2FLTCON4") __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON4CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON4SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON4INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON5 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL20:5;
    unsigned MSEL20:2;
    unsigned FLTEN20:1;
    unsigned FSEL21:5;
    unsigned MSEL21:2;
    unsigned FLTEN21:1;
    unsigned FSEL22:5;
    unsigned MSEL22:2;
    unsigned FLTEN22:1;
    unsigned FSEL23:5;
    unsigned MSEL23:2;
    unsigned FLTEN23:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FLTCON5bits_t;
extern volatile __C2FLTCON5bits_t C2FLTCON5bits __asm__ ("C2FLTCON5") __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON5CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON5SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON5INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON6 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL24:5;
    unsigned MSEL24:2;
    unsigned FLTEN24:1;
    unsigned FSEL25:5;
    unsigned MSEL25:2;
    unsigned FLTEN25:1;
    unsigned FSEL26:5;
    unsigned MSEL26:2;
    unsigned FLTEN26:1;
    unsigned FSEL27:5;
    unsigned MSEL27:2;
    unsigned FLTEN27:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FLTCON6bits_t;
extern volatile __C2FLTCON6bits_t C2FLTCON6bits __asm__ ("C2FLTCON6") __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON6CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON6SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON6INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON7 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FSEL28:5;
    unsigned MSEL28:2;
    unsigned FLTEN28:1;
    unsigned FSEL29:5;
    unsigned MSEL29:2;
    unsigned FLTEN29:1;
    unsigned FSEL30:5;
    unsigned MSEL30:2;
    unsigned FLTEN30:1;
    unsigned FSEL31:5;
    unsigned MSEL31:2;
    unsigned FLTEN31:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FLTCON7bits_t;
extern volatile __C2FLTCON7bits_t C2FLTCON7bits __asm__ ("C2FLTCON7") __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON7CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON7SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FLTCON7INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF0bits_t;
extern volatile __C2RXF0bits_t C2RXF0bits __asm__ ("C2RXF0") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF0SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF0INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF1bits_t;
extern volatile __C2RXF1bits_t C2RXF1bits __asm__ ("C2RXF1") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF1SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF1INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF2bits_t;
extern volatile __C2RXF2bits_t C2RXF2bits __asm__ ("C2RXF2") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF2SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF2INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF3bits_t;
extern volatile __C2RXF3bits_t C2RXF3bits __asm__ ("C2RXF3") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF3SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF3INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF4 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF4bits_t;
extern volatile __C2RXF4bits_t C2RXF4bits __asm__ ("C2RXF4") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF4CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF4SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF4INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF5 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF5bits_t;
extern volatile __C2RXF5bits_t C2RXF5bits __asm__ ("C2RXF5") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF5CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF5SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF5INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF6 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF6bits_t;
extern volatile __C2RXF6bits_t C2RXF6bits __asm__ ("C2RXF6") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF6CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF6SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF6INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF7 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF7bits_t;
extern volatile __C2RXF7bits_t C2RXF7bits __asm__ ("C2RXF7") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF7CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF7SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF7INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF8 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF8bits_t;
extern volatile __C2RXF8bits_t C2RXF8bits __asm__ ("C2RXF8") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF8CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF8SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF8INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF9 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF9bits_t;
extern volatile __C2RXF9bits_t C2RXF9bits __asm__ ("C2RXF9") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF9CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF9SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF9INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF10 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF10bits_t;
extern volatile __C2RXF10bits_t C2RXF10bits __asm__ ("C2RXF10") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF10CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF10SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF10INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF11 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF11bits_t;
extern volatile __C2RXF11bits_t C2RXF11bits __asm__ ("C2RXF11") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF11CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF11SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF11INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF12 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF12bits_t;
extern volatile __C2RXF12bits_t C2RXF12bits __asm__ ("C2RXF12") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF12CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF12SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF12INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF13 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF13bits_t;
extern volatile __C2RXF13bits_t C2RXF13bits __asm__ ("C2RXF13") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF13CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF13SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF13INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF14 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF14bits_t;
extern volatile __C2RXF14bits_t C2RXF14bits __asm__ ("C2RXF14") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF14CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF14SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF14INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF15 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF15bits_t;
extern volatile __C2RXF15bits_t C2RXF15bits __asm__ ("C2RXF15") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF15CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF15SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF15INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF16 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF16bits_t;
extern volatile __C2RXF16bits_t C2RXF16bits __asm__ ("C2RXF16") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF16CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF16SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF16INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF17 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF17bits_t;
extern volatile __C2RXF17bits_t C2RXF17bits __asm__ ("C2RXF17") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF17CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF17SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF17INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF18 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF18bits_t;
extern volatile __C2RXF18bits_t C2RXF18bits __asm__ ("C2RXF18") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF18CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF18SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF18INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF19 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF19bits_t;
extern volatile __C2RXF19bits_t C2RXF19bits __asm__ ("C2RXF19") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF19CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF19SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF19INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF20 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF20bits_t;
extern volatile __C2RXF20bits_t C2RXF20bits __asm__ ("C2RXF20") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF20CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF20SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF20INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF21 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF21bits_t;
extern volatile __C2RXF21bits_t C2RXF21bits __asm__ ("C2RXF21") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF21CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF21SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF21INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF22 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF22bits_t;
extern volatile __C2RXF22bits_t C2RXF22bits __asm__ ("C2RXF22") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF22CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF22SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF22INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF23 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF23bits_t;
extern volatile __C2RXF23bits_t C2RXF23bits __asm__ ("C2RXF23") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF23CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF23SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF23INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF24 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF24bits_t;
extern volatile __C2RXF24bits_t C2RXF24bits __asm__ ("C2RXF24") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF24CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF24SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF24INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF25 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF25bits_t;
extern volatile __C2RXF25bits_t C2RXF25bits __asm__ ("C2RXF25") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF25CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF25SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF25INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF26 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF26bits_t;
extern volatile __C2RXF26bits_t C2RXF26bits __asm__ ("C2RXF26") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF26CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF26SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF26INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF27 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF27bits_t;
extern volatile __C2RXF27bits_t C2RXF27bits __asm__ ("C2RXF27") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF27CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF27SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF27INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF28 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF28bits_t;
extern volatile __C2RXF28bits_t C2RXF28bits __asm__ ("C2RXF28") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF28CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF28SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF28INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF29 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF29bits_t;
extern volatile __C2RXF29bits_t C2RXF29bits __asm__ ("C2RXF29") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF29CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF29SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF29INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF30 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF30bits_t;
extern volatile __C2RXF30bits_t C2RXF30bits __asm__ ("C2RXF30") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF30CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF30SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF30INV __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF31 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned EID:18;
    unsigned :1;
    unsigned EXID:1;
    unsigned :1;
    unsigned SID:11;
  };
  struct {
    unsigned w:32;
  };
} __C2RXF31bits_t;
extern volatile __C2RXF31bits_t C2RXF31bits __asm__ ("C2RXF31") __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF31CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF31SET __attribute__((section("sfrs")));
extern volatile unsigned int C2RXF31INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOBA __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOBACLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOBASET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOBAINV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON0bits_t;
extern volatile __C2FIFOCON0bits_t C2FIFOCON0bits __asm__ ("C2FIFOCON0") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON0SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON0INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT0bits_t;
extern volatile __C2FIFOINT0bits_t C2FIFOINT0bits __asm__ ("C2FIFOINT0") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT0SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT0INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA0 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA0SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA0INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI0bits_t;
extern volatile __C2FIFOCI0bits_t C2FIFOCI0bits __asm__ ("C2FIFOCI0") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI0CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI0SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI0INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON1bits_t;
extern volatile __C2FIFOCON1bits_t C2FIFOCON1bits __asm__ ("C2FIFOCON1") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON1SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON1INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT1bits_t;
extern volatile __C2FIFOINT1bits_t C2FIFOINT1bits __asm__ ("C2FIFOINT1") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT1SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT1INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA1 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA1SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA1INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI1bits_t;
extern volatile __C2FIFOCI1bits_t C2FIFOCI1bits __asm__ ("C2FIFOCI1") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI1CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI1SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI1INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON2bits_t;
extern volatile __C2FIFOCON2bits_t C2FIFOCON2bits __asm__ ("C2FIFOCON2") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON2SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON2INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT2bits_t;
extern volatile __C2FIFOINT2bits_t C2FIFOINT2bits __asm__ ("C2FIFOINT2") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT2SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT2INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA2 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA2SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA2INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI2bits_t;
extern volatile __C2FIFOCI2bits_t C2FIFOCI2bits __asm__ ("C2FIFOCI2") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI2CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI2SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI2INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON3bits_t;
extern volatile __C2FIFOCON3bits_t C2FIFOCON3bits __asm__ ("C2FIFOCON3") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON3SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON3INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT3bits_t;
extern volatile __C2FIFOINT3bits_t C2FIFOINT3bits __asm__ ("C2FIFOINT3") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT3SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT3INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA3 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA3SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA3INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI3bits_t;
extern volatile __C2FIFOCI3bits_t C2FIFOCI3bits __asm__ ("C2FIFOCI3") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI3CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI3SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI3INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON4 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON4bits_t;
extern volatile __C2FIFOCON4bits_t C2FIFOCON4bits __asm__ ("C2FIFOCON4") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON4CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON4SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON4INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT4 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT4bits_t;
extern volatile __C2FIFOINT4bits_t C2FIFOINT4bits __asm__ ("C2FIFOINT4") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT4CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT4SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT4INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA4 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA4CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA4SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA4INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI4 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI4bits_t;
extern volatile __C2FIFOCI4bits_t C2FIFOCI4bits __asm__ ("C2FIFOCI4") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI4CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI4SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI4INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON5 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON5bits_t;
extern volatile __C2FIFOCON5bits_t C2FIFOCON5bits __asm__ ("C2FIFOCON5") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON5CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON5SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON5INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT5 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT5bits_t;
extern volatile __C2FIFOINT5bits_t C2FIFOINT5bits __asm__ ("C2FIFOINT5") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT5CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT5SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT5INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA5 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA5CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA5SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA5INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI5 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI5bits_t;
extern volatile __C2FIFOCI5bits_t C2FIFOCI5bits __asm__ ("C2FIFOCI5") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI5CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI5SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI5INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON6 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON6bits_t;
extern volatile __C2FIFOCON6bits_t C2FIFOCON6bits __asm__ ("C2FIFOCON6") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON6CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON6SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON6INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT6 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT6bits_t;
extern volatile __C2FIFOINT6bits_t C2FIFOINT6bits __asm__ ("C2FIFOINT6") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT6CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT6SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT6INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA6 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA6CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA6SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA6INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI6 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI6bits_t;
extern volatile __C2FIFOCI6bits_t C2FIFOCI6bits __asm__ ("C2FIFOCI6") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI6CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI6SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI6INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON7 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON7bits_t;
extern volatile __C2FIFOCON7bits_t C2FIFOCON7bits __asm__ ("C2FIFOCON7") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON7CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON7SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON7INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT7 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT7bits_t;
extern volatile __C2FIFOINT7bits_t C2FIFOINT7bits __asm__ ("C2FIFOINT7") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT7CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT7SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT7INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA7 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA7CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA7SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA7INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI7 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI7bits_t;
extern volatile __C2FIFOCI7bits_t C2FIFOCI7bits __asm__ ("C2FIFOCI7") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI7CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI7SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI7INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON8 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON8bits_t;
extern volatile __C2FIFOCON8bits_t C2FIFOCON8bits __asm__ ("C2FIFOCON8") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON8CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON8SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON8INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT8 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT8bits_t;
extern volatile __C2FIFOINT8bits_t C2FIFOINT8bits __asm__ ("C2FIFOINT8") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT8CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT8SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT8INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA8 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA8CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA8SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA8INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI8 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI8bits_t;
extern volatile __C2FIFOCI8bits_t C2FIFOCI8bits __asm__ ("C2FIFOCI8") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI8CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI8SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI8INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON9 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON9bits_t;
extern volatile __C2FIFOCON9bits_t C2FIFOCON9bits __asm__ ("C2FIFOCON9") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON9CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON9SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON9INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT9 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT9bits_t;
extern volatile __C2FIFOINT9bits_t C2FIFOINT9bits __asm__ ("C2FIFOINT9") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT9CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT9SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT9INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA9 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA9CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA9SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA9INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI9 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI9bits_t;
extern volatile __C2FIFOCI9bits_t C2FIFOCI9bits __asm__ ("C2FIFOCI9") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI9CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI9SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI9INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON10 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON10bits_t;
extern volatile __C2FIFOCON10bits_t C2FIFOCON10bits __asm__ ("C2FIFOCON10") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON10CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON10SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON10INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT10 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT10bits_t;
extern volatile __C2FIFOINT10bits_t C2FIFOINT10bits __asm__ ("C2FIFOINT10") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT10CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT10SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT10INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA10 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA10CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA10SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA10INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI10 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI10bits_t;
extern volatile __C2FIFOCI10bits_t C2FIFOCI10bits __asm__ ("C2FIFOCI10") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI10CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI10SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI10INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON11 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON11bits_t;
extern volatile __C2FIFOCON11bits_t C2FIFOCON11bits __asm__ ("C2FIFOCON11") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON11CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON11SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON11INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT11 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT11bits_t;
extern volatile __C2FIFOINT11bits_t C2FIFOINT11bits __asm__ ("C2FIFOINT11") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT11CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT11SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT11INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA11 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA11CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA11SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA11INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI11 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI11bits_t;
extern volatile __C2FIFOCI11bits_t C2FIFOCI11bits __asm__ ("C2FIFOCI11") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI11CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI11SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI11INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON12 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON12bits_t;
extern volatile __C2FIFOCON12bits_t C2FIFOCON12bits __asm__ ("C2FIFOCON12") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON12CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON12SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON12INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT12 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT12bits_t;
extern volatile __C2FIFOINT12bits_t C2FIFOINT12bits __asm__ ("C2FIFOINT12") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT12CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT12SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT12INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA12 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA12CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA12SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA12INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI12 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI12bits_t;
extern volatile __C2FIFOCI12bits_t C2FIFOCI12bits __asm__ ("C2FIFOCI12") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI12CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI12SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI12INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON13 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON13bits_t;
extern volatile __C2FIFOCON13bits_t C2FIFOCON13bits __asm__ ("C2FIFOCON13") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON13CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON13SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON13INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT13 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT13bits_t;
extern volatile __C2FIFOINT13bits_t C2FIFOINT13bits __asm__ ("C2FIFOINT13") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT13CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT13SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT13INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA13 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA13CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA13SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA13INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI13 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI13bits_t;
extern volatile __C2FIFOCI13bits_t C2FIFOCI13bits __asm__ ("C2FIFOCI13") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI13CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI13SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI13INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON14 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON14bits_t;
extern volatile __C2FIFOCON14bits_t C2FIFOCON14bits __asm__ ("C2FIFOCON14") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON14CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON14SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON14INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT14 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT14bits_t;
extern volatile __C2FIFOINT14bits_t C2FIFOINT14bits __asm__ ("C2FIFOINT14") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT14CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT14SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT14INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA14 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA14CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA14SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA14INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI14 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI14bits_t;
extern volatile __C2FIFOCI14bits_t C2FIFOCI14bits __asm__ ("C2FIFOCI14") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI14CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI14SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI14INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON15 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON15bits_t;
extern volatile __C2FIFOCON15bits_t C2FIFOCON15bits __asm__ ("C2FIFOCON15") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON15CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON15SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON15INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT15 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT15bits_t;
extern volatile __C2FIFOINT15bits_t C2FIFOINT15bits __asm__ ("C2FIFOINT15") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT15CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT15SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT15INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA15 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA15CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA15SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA15INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI15 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI15bits_t;
extern volatile __C2FIFOCI15bits_t C2FIFOCI15bits __asm__ ("C2FIFOCI15") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI15CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI15SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI15INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON16 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON16bits_t;
extern volatile __C2FIFOCON16bits_t C2FIFOCON16bits __asm__ ("C2FIFOCON16") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON16CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON16SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON16INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT16 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT16bits_t;
extern volatile __C2FIFOINT16bits_t C2FIFOINT16bits __asm__ ("C2FIFOINT16") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT16CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT16SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT16INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA16 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA16CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA16SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA16INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI16 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI16bits_t;
extern volatile __C2FIFOCI16bits_t C2FIFOCI16bits __asm__ ("C2FIFOCI16") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI16CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI16SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI16INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON17 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON17bits_t;
extern volatile __C2FIFOCON17bits_t C2FIFOCON17bits __asm__ ("C2FIFOCON17") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON17CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON17SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON17INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT17 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT17bits_t;
extern volatile __C2FIFOINT17bits_t C2FIFOINT17bits __asm__ ("C2FIFOINT17") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT17CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT17SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT17INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA17 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA17CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA17SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA17INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI17 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI17bits_t;
extern volatile __C2FIFOCI17bits_t C2FIFOCI17bits __asm__ ("C2FIFOCI17") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI17CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI17SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI17INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON18 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON18bits_t;
extern volatile __C2FIFOCON18bits_t C2FIFOCON18bits __asm__ ("C2FIFOCON18") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON18CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON18SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON18INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT18 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT18bits_t;
extern volatile __C2FIFOINT18bits_t C2FIFOINT18bits __asm__ ("C2FIFOINT18") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT18CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT18SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT18INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA18 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA18CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA18SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA18INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI18 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI18bits_t;
extern volatile __C2FIFOCI18bits_t C2FIFOCI18bits __asm__ ("C2FIFOCI18") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI18CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI18SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI18INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON19 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON19bits_t;
extern volatile __C2FIFOCON19bits_t C2FIFOCON19bits __asm__ ("C2FIFOCON19") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON19CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON19SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON19INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT19 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT19bits_t;
extern volatile __C2FIFOINT19bits_t C2FIFOINT19bits __asm__ ("C2FIFOINT19") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT19CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT19SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT19INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA19 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA19CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA19SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA19INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI19 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI19bits_t;
extern volatile __C2FIFOCI19bits_t C2FIFOCI19bits __asm__ ("C2FIFOCI19") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI19CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI19SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI19INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON20 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON20bits_t;
extern volatile __C2FIFOCON20bits_t C2FIFOCON20bits __asm__ ("C2FIFOCON20") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON20CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON20SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON20INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT20 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT20bits_t;
extern volatile __C2FIFOINT20bits_t C2FIFOINT20bits __asm__ ("C2FIFOINT20") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT20CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT20SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT20INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA20 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA20CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA20SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA20INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI20 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI20bits_t;
extern volatile __C2FIFOCI20bits_t C2FIFOCI20bits __asm__ ("C2FIFOCI20") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI20CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI20SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI20INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON21 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON21bits_t;
extern volatile __C2FIFOCON21bits_t C2FIFOCON21bits __asm__ ("C2FIFOCON21") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON21CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON21SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON21INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT21 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT21bits_t;
extern volatile __C2FIFOINT21bits_t C2FIFOINT21bits __asm__ ("C2FIFOINT21") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT21CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT21SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT21INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA21 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA21CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA21SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA21INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI21 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI21bits_t;
extern volatile __C2FIFOCI21bits_t C2FIFOCI21bits __asm__ ("C2FIFOCI21") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI21CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI21SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI21INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON22 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON22bits_t;
extern volatile __C2FIFOCON22bits_t C2FIFOCON22bits __asm__ ("C2FIFOCON22") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON22CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON22SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON22INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT22 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT22bits_t;
extern volatile __C2FIFOINT22bits_t C2FIFOINT22bits __asm__ ("C2FIFOINT22") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT22CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT22SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT22INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA22 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA22CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA22SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA22INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI22 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI22bits_t;
extern volatile __C2FIFOCI22bits_t C2FIFOCI22bits __asm__ ("C2FIFOCI22") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI22CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI22SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI22INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON23 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON23bits_t;
extern volatile __C2FIFOCON23bits_t C2FIFOCON23bits __asm__ ("C2FIFOCON23") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON23CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON23SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON23INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT23 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT23bits_t;
extern volatile __C2FIFOINT23bits_t C2FIFOINT23bits __asm__ ("C2FIFOINT23") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT23CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT23SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT23INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA23 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA23CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA23SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA23INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI23 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI23bits_t;
extern volatile __C2FIFOCI23bits_t C2FIFOCI23bits __asm__ ("C2FIFOCI23") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI23CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI23SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI23INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON24 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON24bits_t;
extern volatile __C2FIFOCON24bits_t C2FIFOCON24bits __asm__ ("C2FIFOCON24") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON24CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON24SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON24INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT24 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT24bits_t;
extern volatile __C2FIFOINT24bits_t C2FIFOINT24bits __asm__ ("C2FIFOINT24") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT24CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT24SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT24INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA24 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA24CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA24SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA24INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI24 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI24bits_t;
extern volatile __C2FIFOCI24bits_t C2FIFOCI24bits __asm__ ("C2FIFOCI24") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI24CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI24SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI24INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON25 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON25bits_t;
extern volatile __C2FIFOCON25bits_t C2FIFOCON25bits __asm__ ("C2FIFOCON25") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON25CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON25SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON25INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT25 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT25bits_t;
extern volatile __C2FIFOINT25bits_t C2FIFOINT25bits __asm__ ("C2FIFOINT25") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT25CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT25SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT25INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA25 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA25CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA25SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA25INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI25 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI25bits_t;
extern volatile __C2FIFOCI25bits_t C2FIFOCI25bits __asm__ ("C2FIFOCI25") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI25CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI25SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI25INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON26 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON26bits_t;
extern volatile __C2FIFOCON26bits_t C2FIFOCON26bits __asm__ ("C2FIFOCON26") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON26CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON26SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON26INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT26 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT26bits_t;
extern volatile __C2FIFOINT26bits_t C2FIFOINT26bits __asm__ ("C2FIFOINT26") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT26CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT26SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT26INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA26 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA26CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA26SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA26INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI26 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI26bits_t;
extern volatile __C2FIFOCI26bits_t C2FIFOCI26bits __asm__ ("C2FIFOCI26") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI26CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI26SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI26INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON27 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON27bits_t;
extern volatile __C2FIFOCON27bits_t C2FIFOCON27bits __asm__ ("C2FIFOCON27") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON27CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON27SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON27INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT27 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT27bits_t;
extern volatile __C2FIFOINT27bits_t C2FIFOINT27bits __asm__ ("C2FIFOINT27") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT27CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT27SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT27INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA27 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA27CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA27SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA27INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI27 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI27bits_t;
extern volatile __C2FIFOCI27bits_t C2FIFOCI27bits __asm__ ("C2FIFOCI27") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI27CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI27SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI27INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON28 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON28bits_t;
extern volatile __C2FIFOCON28bits_t C2FIFOCON28bits __asm__ ("C2FIFOCON28") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON28CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON28SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON28INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT28 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT28bits_t;
extern volatile __C2FIFOINT28bits_t C2FIFOINT28bits __asm__ ("C2FIFOINT28") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT28CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT28SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT28INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA28 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA28CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA28SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA28INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI28 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI28bits_t;
extern volatile __C2FIFOCI28bits_t C2FIFOCI28bits __asm__ ("C2FIFOCI28") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI28CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI28SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI28INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON29 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON29bits_t;
extern volatile __C2FIFOCON29bits_t C2FIFOCON29bits __asm__ ("C2FIFOCON29") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON29CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON29SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON29INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT29 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT29bits_t;
extern volatile __C2FIFOINT29bits_t C2FIFOINT29bits __asm__ ("C2FIFOINT29") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT29CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT29SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT29INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA29 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA29CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA29SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA29INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI29 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI29bits_t;
extern volatile __C2FIFOCI29bits_t C2FIFOCI29bits __asm__ ("C2FIFOCI29") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI29CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI29SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI29INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON30 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON30bits_t;
extern volatile __C2FIFOCON30bits_t C2FIFOCON30bits __asm__ ("C2FIFOCON30") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON30CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON30SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON30INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT30 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT30bits_t;
extern volatile __C2FIFOINT30bits_t C2FIFOINT30bits __asm__ ("C2FIFOINT30") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT30CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT30SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT30INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA30 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA30CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA30SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA30INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI30 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI30bits_t;
extern volatile __C2FIFOCI30bits_t C2FIFOCI30bits __asm__ ("C2FIFOCI30") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI30CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI30SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI30INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON31 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TXPRI:2;
    unsigned RTREN:1;
    unsigned TXREQ:1;
    unsigned TXERR:1;
    unsigned TXLARB:1;
    unsigned TXABAT:1;
    unsigned TXEN:1;
    unsigned :4;
    unsigned DONLY:1;
    unsigned UINC:1;
    unsigned FRESET:1;
    unsigned :1;
    unsigned FSIZE:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCON31bits_t;
extern volatile __C2FIFOCON31bits_t C2FIFOCON31bits __asm__ ("C2FIFOCON31") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON31CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON31SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCON31INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT31 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RXNEMPTYIF:1;
    unsigned RXHALFIF:1;
    unsigned RXFULLIF:1;
    unsigned RXOVFLIF:1;
    unsigned :4;
    unsigned TXEMPTYIF:1;
    unsigned TXHALFIF:1;
    unsigned TXNFULLIF:1;
    unsigned :5;
    unsigned RXNEMPTYIE:1;
    unsigned RXHALFIE:1;
    unsigned RXFULLIE:1;
    unsigned RXOVFLIE:1;
    unsigned :4;
    unsigned TXEMPTYIE:1;
    unsigned TXHALFIE:1;
    unsigned TXNFULLIE:1;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOINT31bits_t;
extern volatile __C2FIFOINT31bits_t C2FIFOINT31bits __asm__ ("C2FIFOINT31") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT31CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT31SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOINT31INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA31 __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA31CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA31SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOUA31INV __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI31 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CFIFOCI:5;
  };
  struct {
    unsigned w:32;
  };
} __C2FIFOCI31bits_t;
extern volatile __C2FIFOCI31bits_t C2FIFOCI31bits __asm__ ("C2FIFOCI31") __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI31CLR __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI31SET __attribute__((section("sfrs")));
extern volatile unsigned int C2FIFOCI31INV __attribute__((section("sfrs")));
extern volatile unsigned int DEVCFG3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned USERID:16;
    unsigned FSRSSEL:3;
    unsigned :5;
    unsigned FMIIEN:1;
    unsigned FETHIO:1;
    unsigned FCANIO:1;
    unsigned :3;
    unsigned FUSBIDIO:1;
    unsigned FVBUSONIO:1;
  };
  struct {
    unsigned w:32;
  };
} __DEVCFG3bits_t;
extern volatile __DEVCFG3bits_t DEVCFG3bits __asm__ ("DEVCFG3") __attribute__((section("sfrs")));
extern volatile unsigned int DEVCFG2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FPLLIDIV:3;
    unsigned :1;
    unsigned FPLLMUL:3;
    unsigned :1;
    unsigned UPLLIDIV:3;
    unsigned :4;
    unsigned UPLLEN:1;
    unsigned FPLLODIV:3;
  };
  struct {
    unsigned w:32;
  };
} __DEVCFG2bits_t;
extern volatile __DEVCFG2bits_t DEVCFG2bits __asm__ ("DEVCFG2") __attribute__((section("sfrs")));
extern volatile unsigned int DEVCFG1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FNOSC:3;
    unsigned :2;
    unsigned FSOSCEN:1;
    unsigned :1;
    unsigned IESO:1;
    unsigned POSCMOD:2;
    unsigned OSCIOFNC:1;
    unsigned :1;
    unsigned FPBDIV:2;
    unsigned FCKSM:2;
    unsigned WDTPS:5;
    unsigned :2;
    unsigned FWDTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __DEVCFG1bits_t;
extern volatile __DEVCFG1bits_t DEVCFG1bits __asm__ ("DEVCFG1") __attribute__((section("sfrs")));
extern volatile unsigned int DEVCFG0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FDEBUG:2;
    unsigned :1;
    unsigned ICESEL:1;
    unsigned :8;
    unsigned PWP:12;
    unsigned BWP:1;
    unsigned :3;
    unsigned CP:1;
  };
  struct {
    unsigned w:32;
  };
} __DEVCFG0bits_t;
extern volatile __DEVCFG0bits_t DEVCFG0bits __asm__ ("DEVCFG0") __attribute__((section("sfrs")));
# 40130 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/proc/p32mx795f512l.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/proc/ppic32mx.h" 1 3
# 40131 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/proc/p32mx795f512l.h" 2 3
# 98 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 2 3
# 184 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 3
typedef unsigned long _reg_t;
# 386 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 3
extern unsigned int _xchsrspss (unsigned int);
# 401 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/cp0defs.h" 1 3
# 402 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/appio.h" 1 3
# 36 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/appio.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 1 3
# 37 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/appio.h" 2 3
# 403 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 2 3
# 41 "exceptions.c" 2



static enum {
 EXCEP_IRQ = 0,
 EXCEP_AdEL = 4,
 EXCEP_AdES,
 EXCEP_IBE,
 EXCEP_DBE,
 EXCEP_Sys,
 EXCEP_Bp,
 EXCEP_RI,
 EXCEP_CpU,
 EXCEP_Overflow,
 EXCEP_Trap,
 EXCEP_IS1 = 16,
 EXCEP_CEU,
 EXCEP_C2E
} _excep_code;

static unsigned int _epc_code;
static unsigned int _excep_addr;


void _general_exception_handler(void)
{
 asm volatile("mfc0 %0,$13" : "=r" (_epc_code));
 asm volatile("mfc0 %0,$14" : "=r" (_excep_addr));

 _epc_code = (_excep_code & 0x0000007C) >> 2;

 while (1) {


 }
}
