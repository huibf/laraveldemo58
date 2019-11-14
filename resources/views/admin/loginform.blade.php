
                    <form method="POST" action="">
                        @csrf


                                <input id="username" type="text"   name="username" value="" required   autofocus>


                                <input id="password" type="password"   name="password" required  >


                                <button type="submit"  >
                                 提交
                                </button>

                        @if (session('error'))
                            <div class="alert alert-success">
                                {{ session('error') }}
                            </div>
                        @endif

                    </form>
