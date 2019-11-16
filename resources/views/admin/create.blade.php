
                    <form method="POST" action="{{url('/admin/store')}}">
                        @csrf

                             姓名：   <input id="name" type="text"   name="name" value=""  ><br>


                             年龄：   <input id="age" type="text"   name="age"   value=""   ><br>


                                <button type="submit"  >
                                 提交
                                </button>

                        @if (session('error'))
                            <div class="alert alert-success">
                                {{ session('error') }}
                            </div>
                        @endif

                    </form>
