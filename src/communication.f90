module communication
  use mpi
  use parallel
  implicit none

  private


  public :: comm_bcast, &
            comm_allreduce, &
            comm_sendrecv, &
            comm_barrier

  interface comm_bcast
    module procedure comm_bcast_integer
    module procedure comm_bcast_integer_1d
    module procedure comm_bcast_integer_2d
    module procedure comm_bcast_integer_3d
    module procedure comm_bcast_real8
    module procedure comm_bcast_real8_1d
    module procedure comm_bcast_real8_2d
    module procedure comm_bcast_real8_3d
    module procedure comm_bcast_real8_4d
    module procedure comm_bcast_complex8
    module procedure comm_bcast_complex8_1d
    module procedure comm_bcast_complex8_2d
    module procedure comm_bcast_complex8_3d
    module procedure comm_bcast_complex8_4d
    module procedure comm_bcast_character
    module procedure comm_bcast_character_1d
    module procedure comm_bcast_logical
 end interface comm_bcast

 interface comm_allreduce
    module procedure comm_allreduce_integer
    module procedure comm_allreduce_integer_1d
    module procedure comm_allreduce_integer_2d
    module procedure comm_allreduce_integer_3d
    module procedure comm_allreduce_real8
    module procedure comm_allreduce_real8_1d
    module procedure comm_allreduce_real8_2d
    module procedure comm_allreduce_real8_3d
    module procedure comm_allreduce_complex8
    module procedure comm_allreduce_complex8_1d
    module procedure comm_allreduce_complex8_2d
    module procedure comm_allreduce_complex8_3d
 end interface comm_allreduce

 interface comm_sendrecv
    module procedure comm_sendrecv_integer
    module procedure comm_sendrecv_integer_1d
    module procedure comm_sendrecv_complex8
    module procedure comm_sendrecv_complex8_1d
    module procedure comm_sendrecv_complex8_2d
    module procedure comm_sendrecv_complex8_3d
 end interface comm_sendrecv

contains
!-------------------------------------------------------------------------------
  function int_switch(if_true, int_true, int_false) result(int_result)
    implicit none
    logical,intent(in) :: if_true
    integer,intent(in) :: int_true, int_false
    integer :: int_result

    if(if_true)then
      int_result = int_true
    else
      int_result = int_false
   end if
  end function int_switch
!-------------------------------------------------------------------------------

  subroutine comm_barrier(communicator)
    integer,intent(in),optional :: communicator
    integer :: id_comm, ierr
    id_comm = int_switch(present(communicator), communicator, comm_group_global)

    call mpi_barrier(id_comm, ierr)

  end subroutine comm_barrier
  
  include "include/comm_bcast.f90"
  include "include/comm_allreduce.f90"
  include "include/comm_sendrecv.f90"

!-------------------------------------------------------------------------------
!-------------------------------------------------------------------------------
!-------------------------------------------------------------------------------
!-------------------------------------------------------------------------------
!-------------------------------------------------------------------------------
end module communication
